# Count
- we can add count to specify the number of resources
```
resource "aws_instance" "instances_5" {
    ami = data_aws_ami.ubuntu.id
    instance_type = "t2.micro"
    count = 3
}
```
- when we run terraform plan
```
# aws_instance.instances_5[0] will be created
...
# aws_instance.instances_5[2] will be created
...
# aws_instance.instances_5[3] will be created
```