provider "aws" {
  region = "us-east-1"
}


data "aws_ami" "ubuntu1404" {
    most_recent = true
    owners      = ["099720109477"] # Canonical
    # name_regex  = "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
    }
}

resource "aws_instance" "instance_2" {
  ami           = data.aws_ami.ubuntu1404.id
  instance_type = "t2.micro"
  tags = {
    Name        = "instance_2"
    Environment = "Development"
    ms-name     = "ms-user-management"
  }
}