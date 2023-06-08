<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.backend_api_ecr_lifecycle_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_lifecycle_policy.backend_ecr_lifecycle_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_lifecycle_policy.frontend_ecr_lifecycle_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.backend_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.frontend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the stack or application for this deployment | `string` | n/a | yes |
| <a name="input_mutability"></a> [mutability](#input\_mutability) | he tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. | `string` | `"MUTABLE"` | no |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false). | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_api_registry_id"></a> [backend\_api\_registry\_id](#output\_backend\_api\_registry\_id) | n/a |
| <a name="output_backend_api_repo_arn"></a> [backend\_api\_repo\_arn](#output\_backend\_api\_repo\_arn) | n/a |
| <a name="output_backend_api_repo_name"></a> [backend\_api\_repo\_name](#output\_backend\_api\_repo\_name) | n/a |
| <a name="output_backend_api_repo_url"></a> [backend\_api\_repo\_url](#output\_backend\_api\_repo\_url) | n/a |
| <a name="output_backend_registry_id"></a> [backend\_registry\_id](#output\_backend\_registry\_id) | n/a |
| <a name="output_backend_repo_arn"></a> [backend\_repo\_arn](#output\_backend\_repo\_arn) | n/a |
| <a name="output_backend_repo_name"></a> [backend\_repo\_name](#output\_backend\_repo\_name) | n/a |
| <a name="output_backend_repo_url"></a> [backend\_repo\_url](#output\_backend\_repo\_url) | n/a |
| <a name="output_frontend_registry_id"></a> [frontend\_registry\_id](#output\_frontend\_registry\_id) | n/a |
| <a name="output_frontend_repo_arn"></a> [frontend\_repo\_arn](#output\_frontend\_repo\_arn) | n/a |
| <a name="output_frontend_repo_name"></a> [frontend\_repo\_name](#output\_frontend\_repo\_name) | n/a |
| <a name="output_frontend_repo_url"></a> [frontend\_repo\_url](#output\_frontend\_repo\_url) | n/a |
<!-- END_TF_DOCS -->