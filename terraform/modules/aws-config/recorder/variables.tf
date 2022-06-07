variable "iam_prefix" {
  type = string 
  description = "The iam role and policy prefix for all IAM resources created by the power-user"
  default = "power-user"
}

variable "permission_boundary_arn" {
  type = string 
  description = "The permission boundary required to enable the power-user to create and attach IAM roles "
}
