variable "region" {
    description = "AWS region to deploy resources"
    type = string
    default = "us-east-1"
}

variable "project" {
    description = "The project name to use for unique resource naming"
    type = string
    default = "project-1"
}

variable "principal_arns" {
    description = "List of ARNs for IAM roles that can assume the Terraform role"
    type = list(string)
    default = null
}