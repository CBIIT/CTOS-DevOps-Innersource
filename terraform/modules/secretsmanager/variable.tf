variable "secrets" {
  description = "Map of secrets to keep in AWS Secrets Manager"
  type        = map(string)
  default     = {}
}

variable "app" {
  description = "The name of the stack or application for this deployment"
  type        = string
}