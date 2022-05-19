<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_opensearch_domain.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain) | resource |
| [aws_s3_bucket.snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_security_group.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The target account ID. Use the aws\_caller\_identity data source to provide this value | `string` | n/a | yes |
| <a name="input_advanced_security_options_enabled"></a> [advanced\_security\_options\_enabled](#input\_advanced\_security\_options\_enabled) | Whether advanced security is enabled (forces a new resource) | `bool` | n/a | yes |
| <a name="input_app"></a> [app](#input\_app) | The name of the application | `string` | n/a | yes |
| <a name="input_auto_snapshot_hour"></a> [auto\_snapshot\_hour](#input\_auto\_snapshot\_hour) | Hour during which the service takes an automated daily snapshot of the indices in the domain. | `number` | `23` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The name of the opensearch domain. | `string` | n/a | yes |
| <a name="input_ebs_enabled"></a> [ebs\_enabled](#input\_ebs\_enabled) | Whether EBS volumes are attached to data nodes in the domain. | `bool` | n/a | yes |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | Size of EBS volumes attached to data nodes (in GiB). | `number` | n/a | yes |
| <a name="input_encrypt_at_rest"></a> [encrypt\_at\_rest](#input\_encrypt\_at\_rest) | Set to true to encrypt Opensearch data at rest using es/kms | `bool` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Either Elasticsearch\_X.Y or OpenSearch\_X.Y to specify the engine version for the Amazon OpenSearch Service domain. For example, OpenSearch\_1.0 or Elasticsearch\_7.9. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type of the data nodes in the cluster. | `string` | n/a | yes |
| <a name="input_log_publishing_enabled"></a> [log\_publishing\_enabled](#input\_log\_publishing\_enabled) | Whether given log publishing option is enabled or not. | `bool` | n/a | yes |
| <a name="input_log_retention"></a> [log\_retention](#input\_log\_retention) | The number of days to retain logs in the Opensearch cloudwatch log group | `number` | n/a | yes |
| <a name="input_log_type"></a> [log\_type](#input\_log\_type) | Type of OpenSearch log. Valid values: INDEX\_SLOW\_LOGS, SEARCH\_SLOW\_LOGS, ES\_APPLICATION\_LOGS, AUDIT\_LOGS. | `string` | n/a | yes |
| <a name="input_node_to_node_encryption"></a> [node\_to\_node\_encryption](#input\_node\_to\_node\_encryption) | Whether to enable node-to-node encryption. If the node\_to\_node\_encryption block is not provided then this defaults to false. | `bool` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnets to deploy the Opensearch cluster into. | `list` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC that the Opensearch cluster is deployed into. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->