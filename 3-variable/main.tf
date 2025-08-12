provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  name_regex  = "ubuntu/images/hvm-ssd/ubuntu-*"
}

resource "aws_instance" "instance_3" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    tags = {
        Name        = "instance_3"
        Environment = "Development"
        ms-name     = "ms-user-management"
    }
}