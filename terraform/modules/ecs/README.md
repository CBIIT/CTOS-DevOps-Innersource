<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.backend_scaling_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.frontend_scaling_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.backend_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_appautoscaling_target.frontend_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_ecs_cluster.ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.ecs_service_backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_service.ecs_service_frontend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_ecs_task_definition.frontend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.ecs_log_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.task_execution_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.task_log_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.app_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the stack or application for this deployment | `string` | n/a | yes |
| <a name="input_backend_container_image_name"></a> [backend\_container\_image\_name](#input\_backend\_container\_image\_name) | Image used in the backend container | `string` | n/a | yes |
| <a name="input_backend_cpu_usage"></a> [backend\_cpu\_usage](#input\_backend\_cpu\_usage) | number of cpu units used by the task | `string` | `"512"` | no |
| <a name="input_backend_memory_usage"></a> [backend\_memory\_usage](#input\_backend\_memory\_usage) | The amount (in MiB) of memory used by the task | `string` | `"1024"` | no |
| <a name="input_backend_port"></a> [backend\_port](#input\_backend\_port) | backend container port to use in ECS | `number` | `8080` | no |
| <a name="input_backend_target_group_arn"></a> [backend\_target\_group\_arn](#input\_backend\_target\_group\_arn) | backend target group arn value | `string` | n/a | yes |
| <a name="input_container_replicas"></a> [container\_replicas](#input\_container\_replicas) | specify the number of container to run | `number` | n/a | yes |
| <a name="input_frontend_container_image_name"></a> [frontend\_container\_image\_name](#input\_frontend\_container\_image\_name) | Image used in the frontend container | `string` | n/a | yes |
| <a name="input_frontend_cpu_usage"></a> [frontend\_cpu\_usage](#input\_frontend\_cpu\_usage) | number of cpu units used by the task | `string` | `"256"` | no |
| <a name="input_frontend_memory_usage"></a> [frontend\_memory\_usage](#input\_frontend\_memory\_usage) | The amount (in MiB) of memory used by the task | `string` | `"512"` | no |
| <a name="input_frontend_port"></a> [frontend\_port](#input\_frontend\_port) | frontend container port to use in ECS | `number` | `80` | no |
| <a name="input_frontend_target_group_arn"></a> [frontend\_target\_group\_arn](#input\_frontend\_target\_group\_arn) | frontend target group arn value | `string` | n/a | yes |
| <a name="input_iam_prefix"></a> [iam\_prefix](#input\_iam\_prefix) | n/a | `string` | `"power-user"` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | ecs launch type - FARGATE or EC2 | `string` | `"FARGATE"` | no |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | ecs network mode - bridge,host,awsvpc | `string` | `"awsvpc"` | no |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | Set of launch types required by the task | `set(string)` | <pre>[<br>  "FARGATE"<br>]</pre> | no |
| <a name="input_scheduling_strategy"></a> [scheduling\_strategy](#input\_scheduling\_strategy) | ecs scheduling strategy | `string` | `"REPLICA"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | provide custom tags | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID the DB instance will be created in | `string` | `""` | no |
| <a name="input_webapp_subnets"></a> [webapp\_subnets](#input\_webapp\_subnets) | private subnet details | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_securitygroup_id"></a> [ecs\_securitygroup\_id](#output\_ecs\_securitygroup\_id) | n/a |
| <a name="output_task_role_name"></a> [task\_role\_name](#output\_task\_role\_name) | n/a |
<!-- END_TF_DOCS -->