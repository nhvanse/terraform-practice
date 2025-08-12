provider "aws" {
  region = "us-east-1"
  s3_use_path_style = true # Required for LocalStack
}

data "aws_ami" "ubuntu1404" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
}


resource "aws_instance" "instance_9" {
    ami           = data.aws_ami.ubuntu1404.id
    instance_type = "t2.micro"
    tags = {
        Name        = "instance_9"
    }
}

output "public_ip" {
    value = aws_instance.instance_9.public_ip
    description = "Public IP of the instance"
}