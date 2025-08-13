provider "aws" {
    region = "us-east-1"
}

# aws ec2 describe-images --query 'Images[*].Name'
# aws ec2 describe-images --filter Name=name,Values=amzn-ami-minimal-pv-2.0.20180810-x86_64-gp2
resource "aws_instance" "instance_1" {
  ami           = "ami-04681a1dbd79675b6" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  tags = {
    Name        = "instance_1"
    Environment = "Development"
    ms-name     = "ms-user-management"
  }
}
