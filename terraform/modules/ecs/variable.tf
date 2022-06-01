variable "app" {
  type        = string
  description = "The name of the stack or application for this deployment"
}

variable "tags" {
  description = "provide custom tags"
  type        = map(string)
  default     = {}
}

variable "container_replicas" {
  description = "specify the number of container to run"
  type        = number
}

variable "launch_type" {
  description = "ecs launch type - FARGATE or EC2"
  type        = string
  default     = "FARGATE"
}

variable "scheduling_strategy" {
  description = "ecs scheduling strategy"
  type        = string
  default     = "REPLICA"
}

variable "webapp_subnets" {
  description = "private subnet details"
  default     = []
  type        = set(string)
}

variable "frontend_target_group_arn" {
  description = "frontend target group arn value"
  type        = string
}

variable "backend_target_group_arn" {
  description = "backend target group arn value"
  type        = string
}

variable "requires_compatibilities" {
  description = "Set of launch types required by the task"
  type        = set(string)
  default     = ["FARGATE"]
}

variable "network_mode" {
  description = "ecs network mode - bridge,host,awsvpc"
  type        = string
  default     = "awsvpc"
}

variable "frontend_cpu_usage" {
  description = "number of cpu units used by the task"
  type        = string
  default     = "256"
}

variable "frontend_memory_usage" {
  description = "The amount (in MiB) of memory used by the task"
  type        = string
  default     = "512"
}

variable "backend_cpu_usage" {
  description = "number of cpu units used by the task"
  type        = string
  default     = "512"
}

variable "backend_memory_usage" {
  description = "The amount (in MiB) of memory used by the task"
  type        = string
  default     = "1024"
}

variable "frontend_container_image_name" {
  description = "Image used in the frontend container"
  type        = string
}

variable "backend_container_image_name" {
  description = "Image used in the backend container"
  type        = string
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "VPC ID the DB instance will be created in"
}

variable "alb_sg_id" {
  description = "security group ID of ALB which needs to be read from ALB module"
  type        = string
}

variable "iam_prefix" {
  type    = string
  default = "power-user"
}

variable "db_instance" {
  description = "DB instance for ECS backend container to access the clickhouse house database."
  type        = string
  default     = ""
}

variable "frontend_port" {
  description = "frontend container port to use in ECS"
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "backend container port to use in ECS"
  type        = number
  default     = 8080
}
