provider "aws" {
  region = "us-east-1"  # Specify the AWS region
}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["099720109477"]  # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
  }
}

resource "aws_instance" "instance_10" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"
  tags = {
    Name        = "instance_10"
  }

  lifecycle {
    create_before_destroy = true  # Ensure the new instance is created before the old one is destroyed
  }
}

output "ami_name" {
  value       = data.aws_ami.ami.name
  description = "AMI name"
  
}
output "public_ip" {
  value       = aws_instance.instance_10.public_ip
  description = "Public IP of the EC2 instance"
  
}