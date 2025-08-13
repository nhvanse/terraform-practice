resource "aws_dynamodb_table" "dynamodb_table_1" {
    name = "${var.project}-terraform-lock-table"
    hash_key = "LockID"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = local.tags
}