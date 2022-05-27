<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_replication_configuration.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_replication_configuration) | resource |
| [aws_ecr_repository.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mutability"></a> [mutability](#input\_mutability) | he tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. | `string` | `"MUTABLE"` | no |
| <a name="input_prod_account_id"></a> [prod\_account\_id](#input\_prod\_account\_id) | The account id for the prod account. Used by the replication configuration | `string` | n/a | yes |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false). | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | n/a |
| <a name="output_repo_arn"></a> [repo\_arn](#output\_repo\_arn) | n/a |
| <a name="output_repo_name"></a> [repo\_name](#output\_repo\_name) | n/a |
| <a name="output_repo_url"></a> [repo\_url](#output\_repo\_url) | n/a |
<!-- END_TF_DOCS -->