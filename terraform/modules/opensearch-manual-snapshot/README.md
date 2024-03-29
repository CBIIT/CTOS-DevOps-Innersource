# OpenSearch with Manual Snapshots

:dart: Architected by Yizhen Chen

This module expands on the generic OpenSearch module offered in this registry by supporting the manual snapshot capability. Moving data from one snapshot to another, or recovering a cluster, can be simplified with a manual snapshot procedure. Snapshots created manually are stored in an S3 bucket that consumers create within this module. In addition to the standard services provisioned in the generic OpenSearch module, this module produces an S3 bucket and the necessary roles and policies to support manual snapshot management within context of an NCI AWS environment.

For more information, please see AWS' documentation on [creating index snapshots in Amazon OpenSearch Service](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-snapshots.html).


## Table of Contents

1. [Module Configuration Insight](https://github.com/CBIIT/CTOS-DevOps-Innersource/tree/opensearch-manual-snapshot/terraform/modules/opensearch-manual-snapshot##module-configuration-insight)
2. [Reference Architecture](https://github.com/CBIIT/CTOS-DevOps-Innersource/tree/main/terraform/modules/opensearch-manual-snapshot##reference-architecture)
3. [Resources](https://github.com/CBIIT/CTOS-DevOps-Innersource/tree/main/terraform/modules/opensearch-manual-snapshot##resources)
4. [Inputs](https://github.com/CBIIT/CTOS-DevOps-Innersource/tree/main/terraform/modules/opensearch-manual-snapshot##inputs)
5. [Outputs](https://github.com/CBIIT/CTOS-DevOps-Innersource/tree/main/terraform/modules/opensearch-manual-snapshot##outputs)

## Module Configuration Insight

**Network Notes** : 
> - Cluster is deployed with VPC support for an extra layer of security.
> - Can be deployed into a single or multiple availability zones (2 zones), depending on configuration variables passed to the module.
> - For each data node within each availability zone, a VPC endpoint is generated and placed within a private subnet dedicated to database instances. 

**Security Notes** :
> - Each VPC endpoint provisioned through the module is wrapped in a security group to control network accessibility of the cluster. The security group allows traffic from within the VPC that the cluster is deployed into.
> - Data stored within the cluster is encrypted at rest with the AWS OpenSearch KMS mechanism.
> - Data in transit between the cluster nodes is encrypted in transit.

**Storage Notes** :
> - It is recommended that an OpenSearch instance type that supports Elastic Block Storage (EBS) instance storage (avoid r6gd, r3, and i3 instance types).
> - Sizing for storage is uniform across all data nodes. Please see AWS' documentation around best practices for [sizing domains](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/sizing-domains.html).
> - The module does not allow consumers to configure master nodes due to the number of available availability zones within the NCI network topology (requires 3 or more availability zones).

**Snapshot Notes** :
> - By default, AWS captures a daily snapshot of managed OpenSearch clusters deployed within a VPC. Consider setting the hour in which the snapshot occurs.
> - Consumers can elect to manually manage snapshots. Manual snapshots are imported or exported on demand, and leverage a S3 bucket deployed in the account (which this module provisions on your behalf).
> - Manual snapshot configurations do not negate the daily automated snapshot activity.

## Reference Architecture
The reference architecture below depicts a multi-az deployment of an OpenSearch cluster that is using an EBS-enabled instance type. The cluster is configured with two data nodes per instance, which equates to a total of four data nodes and four VPC endpoints across the region. Lastly, this reference architecture reflects a configuration that enables manual snapshot activity. Snapshots are stored in AWS S3, and are managed by executables on the Jenkins host instance.

![Opensearch Boundary](./assets/diagram.png)

## Template Module Input Variables
<pre><code>
module "opensearch" {
  source = "github.com/CBIIT/CTOS-DevOps-Innersource/terraform/modules/opensearch-manual-snapshot"

  app                         = 
  availability_zone_count     = 
  ebs_enabled                 = 
  ebs_volume_size             = 
  enable_os_application_logs  = 
  enable_os_index_slow_logs   = 
  enable_os_search_slow_logs  = 
  engine_version              = 
  hot_node_count              = 
  hot_node_type               = 
  iam_prefix                  = 
  jenkins_security_group_id   = 
  log_retention               = 
  master_node_count           = 
  master_node_enabled         = 
  master_node_type            = 
  multi_az                    = 
  snapshot_hour               = 
  subnet_ids                  =
  tier                        = 
  vpc_id                      = 
  warm_node_count             = 
  warm_node_enabled           = 
  warm_node_type              = 
}
</code></pre>

<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.os_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.os_index_slow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.os_search_slow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_iam_service_linked_role.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_opensearch_domain.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain) | resource |
| [aws_opensearch_domain_policy.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain_policy) | resource |
| [aws_s3_bucket.opensearch_snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.opensearch_snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_lifecycle_configuration.opensearch_snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_public_access_block.opensearch_snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.opensearch_snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.opensearch_snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.inbound_jenkins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the application, often times an acronym in all lower case characters (i.e. 'mtp') | `string` | n/a | yes |
| <a name="input_availability_zone_count"></a> [availability\_zone\_count](#input\_availability\_zone\_count) | The number of availability zones to distribute cluster resources across | `number` | `2` | no |
| <a name="input_ebs_enabled"></a> [ebs\_enabled](#input\_ebs\_enabled) | Set to true to enable elastic block storage for your OpenSearch data nodes | `bool` | `true` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | Specify the ebs volume size for each data node (in GiB) | `number` | `30` | no |
| <a name="input_enable_os_application_logs"></a> [enable\_os\_application\_logs](#input\_enable\_os\_application\_logs) | Set to true to forward application (error) logs to CloudWatch | `bool` | `true` | no |
| <a name="input_enable_os_index_slow_logs"></a> [enable\_os\_index\_slow\_logs](#input\_enable\_os\_index\_slow\_logs) | Set to true to forward index slow logs to CloudWatch | `bool` | `true` | no |
| <a name="input_enable_os_search_slow_logs"></a> [enable\_os\_search\_slow\_logs](#input\_enable\_os\_search\_slow\_logs) | Set to true to forward search slow logs to CloudWatch | `bool` | `true` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version of the OpenSearch cluster (i.e. '1.2') | `string` | n/a | yes |
| <a name="input_hot_node_count"></a> [hot\_node\_count](#input\_hot\_node\_count) | The number of hot data nodes to provision to the cluster | `number` | n/a | yes |
| <a name="input_hot_node_type"></a> [hot\_node\_type](#input\_hot\_node\_type) | The instance type to provision for the hot data nodes in the cluster | `string` | `"m6g.large.search"` | no |
| <a name="input_iam_prefix"></a> [iam\_prefix](#input\_iam\_prefix) | The string used to prefix the IAM role or policy name according to NCI power user governance | `string` | `"power-user"` | no |
| <a name="input_jenkins_cidr"></a> [jenkins\_cidr](#input\_jenkins\_cidr) | The CIDR range that Jenkins belongs to | `string` | n/a | yes |
| <a name="input_log_retention"></a> [log\_retention](#input\_log\_retention) | The number of days to save OpenSearch logs sent to CloudWatch | `number` | `90` | no |
| <a name="input_master_node_count"></a> [master\_node\_count](#input\_master\_node\_count) | The number of dedicated master nodes to support the cluster | `number` | `3` | no |
| <a name="input_master_node_enabled"></a> [master\_node\_enabled](#input\_master\_node\_enabled) | Set to true to provision dedicated master nodes for the cluster | `bool` | n/a | yes |
| <a name="input_master_node_type"></a> [master\_node\_type](#input\_master\_node\_type) | The instance type to provision for the dedicated master nodes in the cluster | `string` | `"m6g.large.search"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Set to true to distribute cluster resources across multiple availability zones | `bool` | n/a | yes |
| <a name="input_snapshot_hour"></a> [snapshot\_hour](#input\_snapshot\_hour) | The hour in which OpenSearch will perform automated snapshot operations | `number` | `23` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnets which OpenSearch will be deployed to | `set(string)` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | The target tier for the deployment. If using workspaces, provide 'terraform.workspace' when providing a value for this variable | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the target VPC for the OpenSearch cluster | `string` | n/a | yes |
| <a name="input_warm_node_count"></a> [warm\_node\_count](#input\_warm\_node\_count) | The number of warm nodes in the cluster. Valid values are between 2 and 150 | `number` | `2` | no |
| <a name="input_warm_node_enabled"></a> [warm\_node\_enabled](#input\_warm\_node\_enabled) | Whether or not to enable warm nodes for the cluster | `bool` | `false` | no |
| <a name="input_warm_node_type"></a> [warm\_node\_type](#input\_warm\_node\_type) | Instance type for the OpenSearch cluster's warm nodes. Valid values are ultrawarm1.medium.search, ultrawarm1.large.search and ultrawarm1.xlarge.search | `string` | `"ultrawarm1.large.search"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_opensearch_domain_arn"></a> [opensearch\_domain\_arn](#output\_opensearch\_domain\_arn) | The arn of the OpenSearch domain |
| <a name="output_opensearch_domain_id"></a> [opensearch\_domain\_id](#output\_opensearch\_domain\_id) | The ID of the OpenSearch domain |
| <a name="output_opensearch_domain_name"></a> [opensearch\_domain\_name](#output\_opensearch\_domain\_name) | The domain name of the OpenSearch domain |
| <a name="output_opensearch_endpoint"></a> [opensearch\_endpoint](#output\_opensearch\_endpoint) | The OpenSearch domain endpoint URL |
| <a name="output_opensearch_engine_version"></a> [opensearch\_engine\_version](#output\_opensearch\_engine\_version) | The engine version of the OpenSearch domain (i.e. OpenSearch\_1.2) |
| <a name="output_opensearch_kibana_endpoint"></a> [opensearch\_kibana\_endpoint](#output\_opensearch\_kibana\_endpoint) | The OpenSearch domain dashboard endpoint URL |
| <a name="output_opensearch_securitygroup_arn"></a> [opensearch\_securitygroup\_arn](#output\_opensearch\_securitygroup\_arn) | n/a |
| <a name="output_opensearch_securitygroup_id"></a> [opensearch\_securitygroup\_id](#output\_opensearch\_securitygroup\_id) | n/a |
| <a name="output_opensearch_securitygroup_name"></a> [opensearch\_securitygroup\_name](#output\_opensearch\_securitygroup\_name) | n/a |
| <a name="output_s3_snapshot_bucket_arn"></a> [s3\_snapshot\_bucket\_arn](#output\_s3\_snapshot\_bucket\_arn) | The arn of the bucket that stores the OpenSearch domain manual snapshots |
| <a name="output_s3_snapshot_bucket_id"></a> [s3\_snapshot\_bucket\_id](#output\_s3\_snapshot\_bucket\_id) | The ID of the snapshot S3 bucket |
| <a name="output_s3_snapshot_bucket_name"></a> [s3\_snapshot\_bucket\_name](#output\_s3\_snapshot\_bucket\_name) | The name of the bucket that stores the OpenSearch domain manual snapshots |
<!-- END_TF_DOCS -->