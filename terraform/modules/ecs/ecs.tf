
resource "aws_ecs_cluster" "ecs_cluster" {
  name = local.ecs_cluster_name
  tags = var.tags
}

resource "aws_ecs_service" "ecs_service_frontend" {
  name                               = local.ecs_frontend_service_name #var.ecs_service_name #"${var.app}-${var.tier}-frontend"
  cluster                            = aws_ecs_cluster.ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.frontend.arn
  desired_count                      = var.container_replicas
  launch_type                        = var.ecs_launch_type
  scheduling_strategy                = var.ecs_scheduling_strategy
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  network_configuration {
    security_groups  =  [aws_security_group.app_sg.id]   #create security groups in tf file.
    subnets          = var.webapp_subnets
    assign_public_ip = false
  }
  load_balancer {
    target_group_arn = var.frontend_target_group_arn #module.alb.aws_lb_target_group.target_group.arn  -> get the output from ALB module
    container_name   = "frontend"
    container_port   = local.frontend_port
  }
  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}

resource "aws_ecs_service" "ecs_service_backend" {
  name                               = local.ecs_backend_service_name #"${var.stack_name}-${terraform.workspace}-backend"
  cluster                            = aws_ecs_cluster.ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.backend.arn
  desired_count                      = var.container_replicas
  launch_type                        = var.ecs_launch_type
  scheduling_strategy                = var.ecs_scheduling_strategy
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  network_configuration {
    security_groups  = [aws_security_group.app_sg.id]
    subnets          = var.webapp_subnets
    assign_public_ip = false
  }
  load_balancer {
    target_group_arn = var.backend_target_group_arn # get tge value from output section of ALB aws_lb_target_group.backend_target_group.arn
    container_name   = "backend"
    container_port   = local.backend_port
  }
  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}

resource "aws_ecs_task_definition" "frontend" {
  family                       = local.ecs_family_frontend #var.ecs_task_definition_name #"${var.stack_name}-${var.env}-frontend"
  requires_compatibilities     = var.requires_compatibilities
  network_mode                 = var.network_mode
  cpu                          = var.cpu_usage
  memory                       = var.memory_usage
  execution_role_arn           = aws_iam_role.task_execution_role.arn
  task_role_arn                = aws_iam_role.task_role.arn
  container_definitions        = jsonencode([
    {
      name         = "frontend"
      image        = "${var.frontend_container_image_name}:latest"
      essential    = true
      portMappings = [
        {
          protocol      = local.tcp_protocol
          containerPort = local.frontend_port
          hostPort      = local.frontend_port
        }
      ]
    }])
  tags = var.tags
}

resource "aws_ecs_task_definition" "backend" {
  family                   = local.ecs_family_backend #var.ecs_task_definition_name #"${var.stack_name}-${var.env}-frontend"
  requires_compatibilities = var.requires_compatibilities
  network_mode             = var.network_mode
  cpu                      = var.cpu_usage
  memory                   = var.memory_usage
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  task_role_arn            = aws_iam_role.task_role.arn
  container_definitions    = jsonencode([
    {
      name         = "backend"
      image        = "${var.backend_container_image_name}:latest"
      essential    = true
      portMappings = [
        {
          protocol      = local.tcp_protocol
          containerPort = local.backend_port
          hostPort      = local.backend_port
        }
      ]
    }])
  tags = var.tags
}

#create ecs cluster
resource "aws_appautoscaling_target" "frontend_target" {
  max_capacity       = 5
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.ecs_cluster.name}/${aws_ecs_service.ecs_service_frontend.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_target" "backend_target" {
  max_capacity       = 5
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.ecs_cluster.name}/${aws_ecs_service.ecs_service_backend.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "backend_scaling_cpu" {
  name               = "cpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.backend_target.resource_id
  scalable_dimension = aws_appautoscaling_target.backend_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.backend_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value = 80
  }
}

resource "aws_appautoscaling_policy" "frontend_scaling_cpu" {
  name               = "cpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.frontend_target.resource_id
  scalable_dimension = aws_appautoscaling_target.frontend_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.frontend_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value = 80
  }
}