# Get the current AWS account ID
data "aws_caller_identity" "current" {} 

locals {
    # Get from environment variables or use the arn of the current user
    principal_arns = var.principal_arns != null ? var.principal_arns : [data.aws_caller_identity.current.arn]
}


output "arns" {
    value = local.principal_arns
    description = "List of ARNs for IAM roles that can assume the Terraform role"
}

data "aws_iam_policy_document" "policy_doc_1" {
    statement {
      actions = ["s3:ListBucket"]
      resources = [aws_s3_bucket.s3_bucket_1.arn]
    }

    statement {
      actions = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
      resources = ["${aws_s3_bucket.s3_bucket_1.arn}/*"]
    }

    statement {
        actions = ["dynamodb:PutItem", "dynamodb:GetItem", "dynamodb:DeleteItem"]
        resources = [aws_dynamodb_table.dynamodb_table_1.arn]
    }
  
}


resource "aws_iam_policy" "iam_policy_1" {
    name        = "${var.project}-terraform-policy-1"
    description = "Policy for Terraform to access S3 and DynamoDB"
    policy      = data.aws_iam_policy_document.policy_doc_1.json
}

resource "aws_iam_role" "iam_role_1" {
    name = "${var.project}-terraform-role-1"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = {
                    AWS = "${join(",", local.principal_arns)}"
                }
                Action = "sts:AssumeRole"
            }
        ]
    })
    tags = local.tags
}


resource "aws_iam_role_policy_attachment" "policy_attachment_1" {
    role       = aws_iam_role.iam_role_1.name
    policy_arn = aws_iam_policy.iam_policy_1.arn
}