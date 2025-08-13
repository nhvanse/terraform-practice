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

resource "aws_instance" "instances_6" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    tags = {
      "Group" = "instance_group_6"
    }
    count = 3
}

output "instance_details" {
    value = {
        public_ips = [for instance in aws_instance.instances_6 : instance.public_ip]
        public_ips_using_regex = aws_instance.instances_6[*].public_ip
    }
    description = "Details of the EC2 instance created in 6-for/main.tf"
}