variable "app" {
  type        = string
  description = "The name of the application, often times an acronym in all lower case characters (i.e. 'mtp')"
}

variable "availability_zone_count" {
  type        = number
  description = "The number of availability zones to distribute cluster resources across"
  default     = 2
}

variable "ebs_enabled" {
  type        = bool
  description = "Set to true to enable elastic block storage for your OpenSearch data nodes"
  default     = true
}

variable "ebs_volume_size" {
  type        = number
  description = "Specify the ebs volume size for each data node (in GiB)"
  default     = 30
}

variable "enable_os_application_logs" {
  type        = bool
  description = "Set to true to forward application (error) logs to CloudWatch"
  default     = true
}

variable "enable_os_index_slow_logs" {
  type        = bool
  description = "Set to true to forward index slow logs to CloudWatch"
  default     = true
}

variable "enable_os_search_slow_logs" {
  type        = bool
  description = "Set to true to forward search slow logs to CloudWatch"
  default     = true
}

variable "engine_version" {
  type        = string
  description = "The engine version of the OpenSearch cluster (i.e. '1.2')"
}

variable "hot_node_count" {
  type        = number
  description = "The number of hot data nodes to provision to the cluster"
}

variable "hot_node_type" {
  type        = string
  description = "The instance type to provision for the hot data nodes in the cluster"
  default     = "m6g.large.search"
}

variable "iam_prefix" {
  type        = string
  description = "The string used to prefix the IAM role or policy name according to NCI power user governance"
  default     = "power-user"
}

variable "log_retention" {
  type        = number
  description = "The number of days to save OpenSearch logs sent to CloudWatch"
  default     = 90
}

variable "master_node_count" {
  type        = number
  description = "The number of dedicated master nodes to support the cluster"
  default     = 3
}

variable "master_node_enabled" {
  type        = bool
  description = "Set to true to provision dedicated master nodes for the cluster"
}

variable "master_node_type" {
  type        = string
  description = "The instance type to provision for the dedicated master nodes in the cluster"
  default     = "m6g.large.search"
}

variable "multi_az" {
  type        = bool
  description = "Set to true to distribute cluster resources across multiple availability zones"
}

variable "snapshot_hour" {
  type        = number
  description = "The hour in which OpenSearch will perform automated snapshot operations"
  default     = 23
}

variable "subnet_ids" {
  type        = set(string)
  description = "The subnets which OpenSearch will be deployed to"
}

variable "tier" {
  type        = string
  description = "The target tier for the deployment. If using workspaces, provide 'terraform.workspace' when providing a value for this variable"
}

variable "warm_node_count" {
  type        = number
  description = "The number of warm nodes in the cluster. Valid values are between 2 and 150"
  default     = 2
}

variable "warm_node_enabled" {
  type        = bool
  description = "Whether or not to enable warm nodes for the cluster"
  default     = false
}

variable "warm_node_type" {
  type        = string
  description = "Instance type for the OpenSearch cluster's warm nodes. Valid values are ultrawarm1.medium.search, ultrawarm1.large.search and ultrawarm1.xlarge.search"
  default     = "ultrawarm1.large.search"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the target VPC for the OpenSearch cluster"
}
