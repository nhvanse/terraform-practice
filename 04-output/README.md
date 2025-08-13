# output
- we can create output block
```hcl
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
```
- when we run terraform apply, it will print out:
```
ec2_output = {
  "ami_id" = "ami-1e749f67"
  "instance_id" = "i-6ed2ab7fa5ad4e265"
  "instance_type" = "t2.micro"
  "private_ip" = "10.249.173.202"
  "public_ip" = "54.214.228.242"
  "tags" = tomap({
    "Name" = "instance_4"
  })
}
```