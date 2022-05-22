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
  type = set(string)
}

variable "snapshot_hour" {
  type = number
}

variable "encrypt_rest" {
  type = bool
}

variable "node_to_node_encryption" {
  type = bool
}

variable "logs_enabled" {
  type = bool
}

variable "log_type" {
  type = string
}

variable "log_retention" {
  type = number
}

variable "vpc_id" {
  type = string
}

variable "jenkins_host_id" {
  type = string
}
