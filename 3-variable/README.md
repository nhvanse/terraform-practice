### variable

## Files
- **`variable.tf`**: Defines the variables used in the Terraform configuration.
- **`main.tf`**: Contains the main Terraform configuration that references the variables.
- **`terraform.tfvars`** (optional): Provides default values for variables.

## Variable Example
The `variable.tf` file defines a variable named `instance_type`:
```hcl
variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
}
```


## Apply

```
# load default
terraform apply

# specify variable
terraform apply -var="instance_type=t3.small"


# load from a specific file
terraform apply -var-file="production.tfvars"
```


## Validation
```
variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
  validation {
    condition     = contains(["t2.micro", "t3.small"], var.instance_type)
    error_message = "Instance type must be either t2.micro or t3.small."
  }
}
```