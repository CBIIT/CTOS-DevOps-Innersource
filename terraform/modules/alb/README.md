<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_certificate.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_certificate) | resource |
| [aws_s3_bucket.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_lifecycle_configuration.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_policy.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.s3_alb_log_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.alb-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.alb_inbound_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.alb_outbound_all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the stack or application for this deployment | `string` | n/a | yes |
| <a name="input_create_timeout"></a> [create\_timeout](#input\_create\_timeout) | The time allowed for timeout when creating the ALB resource. | `string` | `"10 minutes"` | no |
| <a name="input_drop_invalid_header"></a> [drop\_invalid\_header](#input\_drop\_invalid\_header) | Indicates whether HTTP headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false). The default is false. Elastic Load Balancing requires that message header names contain only alphanumeric characters and hyphens. Only valid for Load Balancers of type application. | `bool` | `true` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false. | `bool` | `true` | no |
| <a name="input_inbound_cidr"></a> [inbound\_cidr](#input\_inbound\_cidr) | n/a | `list(string)` | n/a | yes |
| <a name="input_internal"></a> [internal](#input\_internal) | Set to true for non-prod accounts that do not have egress out to the internet or public subnets. | `bool` | n/a | yes |
| <a name="input_listener_ssl_policy"></a> [listener\_ssl\_policy](#input\_listener\_ssl\_policy) | Name of the SSL Policy for the associated listener, which is required if the protocol is TLS or HTTPS | `string` | `"ELBSecurityPolicy-2016-08"` | no |
| <a name="input_outbound_cidr"></a> [outbound\_cidr](#input\_outbound\_cidr) | n/a | `list(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The subnets for which the ALBs point to. | `set(string)` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | The target tier for the deployment. If using workspaces, provide 'terraform.workspace' as the input for this variable | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | The type of load balancer to create. Possible values are application, gateway, or network. The default value is application | `string` | `"application"` | no |
| <a name="input_use_wildcard_cert"></a> [use\_wildcard\_cert](#input\_use\_wildcard\_cert) | n/a | `bool` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The target VPC for which to deploy the stack into | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_arn"></a> [alb\_arn](#output\_alb\_arn) | n/a |
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | n/a |
| <a name="output_alb_id"></a> [alb\_id](#output\_alb\_id) | n/a |
| <a name="output_listener_http_arn"></a> [listener\_http\_arn](#output\_listener\_http\_arn) | n/a |
| <a name="output_listener_http_id"></a> [listener\_http\_id](#output\_listener\_http\_id) | n/a |
| <a name="output_listener_https_arn"></a> [listener\_https\_arn](#output\_listener\_https\_arn) | n/a |
| <a name="output_listener_https_id"></a> [listener\_https\_id](#output\_listener\_https\_id) | n/a |
| <a name="output_s3_logs_arn"></a> [s3\_logs\_arn](#output\_s3\_logs\_arn) | n/a |
| <a name="output_securitygroup_arn"></a> [securitygroup\_arn](#output\_securitygroup\_arn) | n/a |
| <a name="output_securitygroup_id"></a> [securitygroup\_id](#output\_securitygroup\_id) | n/a |
| <a name="output_wildcard_cert_domain"></a> [wildcard\_cert\_domain](#output\_wildcard\_cert\_domain) | n/a |
<!-- END_TF_DOCS -->