provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"] # Canonical
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
    }
}

output "ami_output" {
    value = data.aws_ami.ubuntu
    description = "AMI details"
}

resource "aws_instance" "instance_4" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    tags = {
        Name        = "instance_4"
    }
}

output "ec2_output" {
    value = {
        instance_id = aws_instance.instance_4.id
        public_ip   = aws_instance.instance_4.public_ip
        private_ip  = aws_instance.instance_4.private_ip
        ami_id      = data.aws_ami.ubuntu.id
        instance_type = aws_instance.instance_4.instance_type
        tags = aws_instance.instance_4.tags
    }
    description = "Details of the EC2 instance created"
}

