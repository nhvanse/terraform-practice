provider "aws" {
  region = var.region
  endpoints {
    sts = "http://localhost:4566" # LocalStack STS endpoint
  }
  s3_use_path_style = true # Required for LocalStack
}


locals {
  tags = {
    project     = var.project
  }
}

data "aws_region" "current" {}

resource "aws_resourcegroups_group" "aws_resourcegroups_group_1" {
    name       = "${var.project}-resource-group"
    resource_query {
        query = jsonencode({
            ResourceTypeFilters = ["AWS::AllSupported"]
            TagFilters = [{
                Key    = "project"
                Values = [var.project]
            }]
        })
    }
}

output "config" {
    value = {
        region = data.aws_region.current.id
        project = var.project
        resource_group = aws_resourcegroups_group.aws_resourcegroups_group_1.name
        bucket = aws_s3_bucket.s3_bucket_1.bucket
        dynamodb_table = aws_dynamodb_table.dynamodb_table_1.name
        iam_role = aws_iam_role.iam_role_1.name
    }
    description = "Configuration details"
  
}

