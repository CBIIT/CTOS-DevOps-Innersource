variable "account_id" {
  type        = string
  description = "The target account ID. Use the aws_caller_identity data source to provide this value"
}

variable "advanced_security_options_enabled" {
  type        = bool
  description = "Whether advanced security is enabled (forces a new resource)"
}

variable "app" {
  type        = string
  description = "The name of the application"
}

variable "auto_snapshot_hour" {
  type        = number
  default     = 23
  description = "Hour during which the service takes an automated daily snapshot of the indices in the domain."
}

variable "domain" {
  type        = string
  description = "The name of the opensearch domain."
}

variable "ebs_enabled" {
  type        = bool
  description = "Whether EBS volumes are attached to data nodes in the domain."
}

variable "ebs_volume_size" {
  type        = number
  description = "Size of EBS volumes attached to data nodes (in GiB)."
}

variable "encrypt_at_rest" {
  type = bool 
  description = "Set to true to encrypt Opensearch data at rest using es/kms"
}

variable "engine_version" {
  type        = string
  description = "Either Elasticsearch_X.Y or OpenSearch_X.Y to specify the engine version for the Amazon OpenSearch Service domain. For example, OpenSearch_1.0 or Elasticsearch_7.9."
}

variable "instance_type" {
  type        = string
  description = "The instance type of the data nodes in the cluster."
}

variable "log_publishing_enabled" {
  type        = bool
  description = "Whether given log publishing option is enabled or not."
}

variable "log_retention" {
  type = number 
  description = "The number of days to retain logs in the Opensearch cloudwatch log group"
}

variable "log_type" {
  type        = string
  description = "Type of OpenSearch log. Valid values: INDEX_SLOW_LOGS, SEARCH_SLOW_LOGS, ES_APPLICATION_LOGS, AUDIT_LOGS."
}

variable "node_to_node_encryption" {
  type        = bool
  description = "Whether to enable node-to-node encryption. If the node_to_node_encryption block is not provided then this defaults to false."
}

variable "subnet_ids" {
  type        = list
  description = "The subnets to deploy the Opensearch cluster into."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC that the Opensearch cluster is deployed into."
}
