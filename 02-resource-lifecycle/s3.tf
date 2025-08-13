provider "aws" {
  region = "us-east-1"
  s3_use_path_style = true # Required for LocalStack
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper = false
}

resource "aws_s3_bucket" "bucket1" {
    bucket = "bucket1-${random_string.suffix.result}"
    tags = {
        Name    = "bucket1"
    }
}