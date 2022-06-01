<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.secrets_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the stack or application for this deployment | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Map of secrets to keep in AWS Secrets Manager | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_manager_arn"></a> [secret\_manager\_arn](#output\_secret\_manager\_arn) | n/a |
| <a name="output_secret_manager_id"></a> [secret\_manager\_id](#output\_secret\_manager\_id) | n/a |
| <a name="output_secret_manager_version_id"></a> [secret\_manager\_version\_id](#output\_secret\_manager\_version\_id) | n/a |
<!-- END_TF_DOCS -->