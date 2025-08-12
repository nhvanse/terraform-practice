terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
  s3_use_path_style = true # Required for LocalStack
}

data "aws_ami" "ami" {
    most_recent = true
    owners      = ["099720109477"] # Canonical
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
    }
}

resource "aws_instance" "instance_11" {
    ami           = data.aws_ami.ami.id
    instance_type = "t2.micro"
    tags = {
        Name        = "instance_11"
    }

    lifecycle {
        create_before_destroy = true
    }
}