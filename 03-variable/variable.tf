variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
  validation {
    condition     = contains(["t2.micro", "t3.small"], var.instance_type)
    error_message = "Instance type must be either t2.micro or t3.small."
  }
}