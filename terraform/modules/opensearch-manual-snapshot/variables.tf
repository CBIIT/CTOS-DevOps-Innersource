variable "app" {
  type        = string
  description = "The name of the application, often times an acronym in all lower case (i.e. 'mtp')."
}

variable "tier" {
  type        = string
  description = "The target tier for the deployment. If using workspaces, provide 'terraform.workspace' as the input variable value"
}

variable "engine_version" {
  type        = string
  description = "The engine version of the OpenSearch cluster. Examples include OpenSearch_1.0 and OpenSearch_1.2"
}

variable "instance_type" {
  type        = string
  description = "Specify the instance type for the OpenSearch cluster. For example, t3.medium.search"
}

variable "iam_prefix" {
  type        = string
  description = "The string used to prefix the IAM role or policy name according to NCI power user governance"
  default     = "power-user"
}

variable "data_node_count" {
  type        = number
  description = "Specify the number of OpenSearch data nodes per instance within the cluster"
}

variable "multi-az" {
  type        = bool
  description = "Set this value to true in order to provision a multi-availability zone cluster distribution"
}

variable "ebs_enabled" {
  type        = bool
  description = "Set to true to enable elastic block storage for your OpenSearch data nodes"
}

variable "ebs_volume_size" {
  type        = number
  description = "Specify the ebs volume size for each data node (in GiB)"
}

variable "subnet_ids" {
  type        = set(string)
  description = "The subnets which OpenSearch will be deployed to"
}

variable "snapshot_hour" {
  type        = number
  description = "The hour in which OpenSearch will perform automated snapshot operations"
  default     = 23
}

variable "log_type" {
  type        = string
  description = "The type of OpenSearch logs to forward to CloudWatch. Options include 'INDEX_SLOW_LOGS, 'SEARCH_SLOW_LOGS', 'ES_APPLICATION_LOGS', and 'AUDIT_LOGS'"
  default     = "INDEX_SLOW_LOGS"
}

variable "log_retention" {
  type        = number
  description = "The number of days to save OpenSearch logs sent to CloudWatch"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the target VPC for the OpenSearch cluster"
}

variable "dedicated_master_enabled" {
  type        = bool
  description = "Set to true to enable dedicated master nodes"
  default     = false
}

variable "dedicated_master_count" {
  type        = number
  description = "The number of dedicated master nodes"
  default     = 3
}

variable "dedicated_master_type" {
  type        = string
  description = "The instance type that hosts the dedicated master nodes"
  default     = "m6g.large.search"
}
