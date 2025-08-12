provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
    owners = ["099720109477"] # Canonical
    most_recent = true
    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
    }
}

resource "aws_instance" "instances_5" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    count = 3
}
