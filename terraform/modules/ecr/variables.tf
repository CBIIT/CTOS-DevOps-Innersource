variable "mutability" {
  type        = string
  description = "he tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE."
  default     = "MUTABLE"
}

variable "scan_on_push" {
  type        = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
  default     = true
}

variable "app" {
  type        = string
  description = "The name of the stack or application for this deployment"
}
