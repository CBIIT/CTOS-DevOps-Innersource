# General Variables
variable "app" {
  type        = string
  description = "The name of the stack or application for this deployment"
}

variable "vpc_id" {
  type        = string
  description = "The target VPC for which to deploy the stack into"
}

variable "tier" {
  type        = string
  description = "The target tier for the deployment. If using workspaces, provide 'terraform.workspace' as the input for this variable"
}

# ALB Variables
variable "internal" {
  type        = bool
  description = "Sets the ALB to be internal if access to the internet is not available"
}

variable "type" {
  type        = string
  description = "The type of load balancer to create. Possible values are application, gateway, or network. The default value is application"
  default     = "application"
}

variable "drop_invalid_header" {
  type        = bool
  description = "Indicates whether HTTP headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false). The default is false. Elastic Load Balancing requires that message header names contain only alphanumeric characters and hyphens. Only valid for Load Balancers of type application."
  default     = true
}

variable "enable_deletion_protection" {
  type        = bool
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  default     = true
}

variable "subnets" {
  type        = set(string)
  description = "The subnets for which the ALBs point to."
}

variable "create_timeout" {
  type        = string
  description = "The time allowed for timeout when creating the ALB resource."
  default     = "10m"
}

variable "alb_listener_ssl_policy" {
  type        = string
  description = "Name of the SSL Policy for the associated listener, which is required if the protocol is TLS or HTTPS"
  default     = "ELBSecurityPolicy-2016-08"
}

# Security Group Variables

variable "alb_inbound_cidr" {
  type = string
}

variable "alb_outbound_cidr" {

}