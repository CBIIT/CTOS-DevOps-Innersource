<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.ecs_service_frontend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_service.ecs_service_backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.frontend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_ecs_task_definition.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_appautoscaling_target.frontend_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_appautoscaling_target.backend_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_appautoscaling_policy.backend_scaling_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.frontend_scaling_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_iam_role.task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.task_execution_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.ecs_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ecs_log_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.task_execution_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.task_log_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the stack or application for this deployment | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region in which the infrastructure is deployed | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | no |
| <a name="input_container_replicas"></a> [container\_replicas](#input\_container\_replicas) | specify the number of container to run. | `number` | n/a | yes |
| <a name="input_ecs_launch_type"></a> [ecs\_launch\_type](#input\_ecs\_launch\_type) | ecs launch type - FARGATE or EC2. | `string` | `FARGATE` | no |
| <a name="input_ecs_scheduling_strategy"></a> [ecs\_scheduling\_strategy](#input\_ecs\_scheduling\_strategy) | Scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. | `string` | `REPLICA` | no |
| <a name="input_webapp_subnets"></a> [webapp\_subnets](#input\_webapp\_subnets) | private application subnet used for ecs deployment | `list(string)` | n/a | yes |
| <a name="input_frontend_target_group_arn"></a> [frontend\_target\_group\_arn](#input\_frontend\_target\_group\_arn) | frontend target group arn value. | `string` | n/a | yes |
| <a name="input_backend_target_group_arn"></a> [backend\_target\_group\_arn](#input\_backend\_target\_group\_arn) | backend target group arn value. | `string` | n/a | yes |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | Set of launch types required by the task | `list(string)` | `["FARGATE"]` | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | ecs network mode - bridge,host,awsvpc. | `string` | `"awsvpc"` | no |
| <a name="input_cpu_usage"></a> [cpu\_usage](#input\_cpu\_usage) | number of cpu units used by the task. | `string` | `"256"` | yes |
| <a name="input_memory_usage"></a> [memory\_usage](#input\_memory\_usage) | The amount (in MiB) of memory used by the task. | `string` | `"512"` | yes |
| <a name="input_frontend_container_image_name"></a> [frontend\_container\_image\_name](#input\_frontend\_container\_image\_name) | Image used in the frontend container. | `string` | n/a | yes |
| <a name="input_backend_container_image_name"></a> [backend\_container\_image\_name](#input\_backend\_container\_image\_name) | Image used in the backend container. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The target VPC for which to deploy the stack into | `string` | n/a | yes |
| <a name="input_alb_sg_id"></a> [frontend\_alb\_sg\_id](#input\_frontend\alb\sg\_id) | security group ID of ALB which needs to be read from ALB module. | `list` | n/a | yes |
| <a name="input_iam_prefix"></a> [iam\_prefix](#input\_iam\_prefix) | n/a | `string` | power-user | no |
| <a name="input_db_instance"></a> [db\_instance](#input\_db\_instance) | DB instance for ECS backend container to access the clickhouse house database. | `string` | n/a | yes |
