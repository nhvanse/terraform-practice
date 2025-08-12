resource "aws_s3_bucket" "s3_bucket_1" {
    bucket = "${var.project}-terrarform-bucket-1"
    force_destroy = false
    tags = local.tags
}


resource "aws_s3_bucket_versioning" "s3_bucket_1" {
    bucket = aws_s3_bucket.s3_bucket_1.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_kms_key" "kms_key_1" {
    tags = local.tags
}


resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_1_sse" {
    bucket = aws_s3_bucket.s3_bucket_1.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "aws:kms"
            kms_master_key_id = aws_kms_key.kms_key_1.id
        }
    }
  
}