terraform {
  backend "s3" {
    bucket = "project-1-terrarform-bucket-1"
    use_path_style = true # Required for LocalStack
    key = "project-2-key"
    region = "us-east-1"
    use_lockfile = true # enable s3 state locking
    encrypt = true
    # dynamodb_table = "project-1-terraform-lock-table" # deprecated
  }
}