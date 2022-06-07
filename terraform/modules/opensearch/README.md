<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_opensearch_domain.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain) | resource |
| [aws_security_group.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | n/a | `string` | n/a | yes |
| <a name="input_data_node_count"></a> [data\_node\_count](#input\_data\_node\_count) | n/a | `number` | n/a | yes |
| <a name="input_ebs_enabled"></a> [ebs\_enabled](#input\_ebs\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | n/a | `number` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `string` | n/a | yes |
| <a name="input_iam_prefix"></a> [iam\_prefix](#input\_iam\_prefix) | n/a | `string` | `"power-user"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_log_retention"></a> [log\_retention](#input\_log\_retention) | The number of days to save OpenSearch logs sent to CloudWatch | `number` | n/a | yes |
| <a name="input_log_type"></a> [log\_type](#input\_log\_type) | The type of OpenSearch logs to forward to CloudWatch. Options include 'INDEX\_SLOW\_LOGS, 'SEARCH\_SLOW\_LOGS', 'ES\_APPLICATION\_LOGS', and 'AUDIT\_LOGS' | `string` | `"INDEX_SLOW_LOGS"` | no |
| <a name="input_multi-az"></a> [multi-az](#input\_multi-az) | n/a | `bool` | n/a | yes |
| <a name="input_snapshot_hour"></a> [snapshot\_hour](#input\_snapshot\_hour) | The hour in which OpenSearch will perform automated snapshot operations | `number` | `23` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnets which OpenSearch will be deployed to | `set(string)` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_opensearch_arn"></a> [opensearch\_arn](#output\_opensearch\_arn) | n/a |
| <a name="output_opensearch_domain_id"></a> [opensearch\_domain\_id](#output\_opensearch\_domain\_id) | n/a |
| <a name="output_opensearch_domain_name"></a> [opensearch\_domain\_name](#output\_opensearch\_domain\_name) | n/a |
| <a name="output_opensearch_endpoint"></a> [opensearch\_endpoint](#output\_opensearch\_endpoint) | n/a |
| <a name="output_opensearch_securitygroup_id"></a> [opensearch\_securitygroup\_id](#output\_opensearch\_securitygroup\_id) | n/a |
<!-- END_TF_DOCS -->