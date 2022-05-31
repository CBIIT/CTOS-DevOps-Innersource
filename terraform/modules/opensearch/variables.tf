variable "app" {
  type = string
}

variable "tier" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "data_node_count" {
  type = number
}

variable "multi-az" {
  type = bool
}

variable "ebs_enabled" {
  type = bool
}

variable "ebs_volume_size" {
  type = number
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
  type = string
}

variable "iam_prefix" {
  type    = string
  default = "power-user"
}