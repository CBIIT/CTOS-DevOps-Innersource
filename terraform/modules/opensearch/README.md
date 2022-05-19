# AWS-Managed Opensearch Cluster


The Opensearch module is a reusable configuration that allows project teams to provision an AWS-Managed Opensearch cluster. This module supports manual snapshot management by incorporating an S3 bucket and appropriate IAM roles to allow snapshot exports and restore activity. 

Please see the AWS documentation that describes how to [create index snapshots](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-snapshots.html) for more information.


<!-- BEGIN_TF_DOCS -->
# Requirements

No requirements.

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Modules

No modules.

# Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_opensearch_domain.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain) | resource |
| [aws_s3_bucket.snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_security_group.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

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
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | The subnets to deploy the Opensearch cluster into. | `list` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC that the Opensearch cluster is deployed into. | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_opensearch_arn"></a> [opensearch\_arn](#output\_opensearch\_arn) | The ARN for the Opensearch Cluster/Instance |
| <a name="output_opensearch_cloudwatch_log_group_arn"></a> [opensearch\_cloudwatch\_log\_group\_arn](#output\_opensearch\_cloudwatch\_log\_group\_arn) | The ARN for the log group that stores Opensearch logs in CloudWatch |
| <a name="output_opensearch_domain"></a> [opensearch\_domain](#output\_opensearch\_domain) | The Domain Name of the Opensearch Cluster/Instance |
| <a name="output_opensearch_security_group_id"></a> [opensearch\_security\_group\_id](#output\_opensearch\_security\_group\_id) | The security group that controls access to the Opensearch Cluster/Instance |
| <a name="output_s3_snapshot_bucket_arn"></a> [s3\_snapshot\_bucket\_arn](#output\_s3\_snapshot\_bucket\_arn) | The ARN of the S3 Bucket that stores snapshots for Opensearch |
| <a name="output_s3_snapshot_bucket_name"></a> [s3\_snapshot\_bucket\_name](#output\_s3\_snapshot\_bucket\_name) | The bucket name for the S3 Bucket that stores snapshots for Opensearch |
| <a name="output_snapshot_iam_role_arn"></a> [snapshot\_iam\_role\_arn](#output\_snapshot\_iam\_role\_arn) | The ARN for the IAM role that enables manual snapshot events for Opensearch |
<!-- END_TF_DOCS -->