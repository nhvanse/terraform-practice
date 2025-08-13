# resource lyfecycle

![lifecycle](./image.png)

![s3](./image-1.png)


## methods
![methods](./image-2.png)



## test s3
- Check [s3.tf](./s3.tf)
- using resource random_string, the random string result will be saved in terraform.tfstate
- Must set `s3_use_path_style` as `true` because we are using LocalStack

## Run plan

![plan](./image-3.png)


## Run apply
```
terraform apply -auto-approve
```
- call create method
![create method](./image-5.png)

## Result
![s3 bucket result](./image-4.png)


## Resource Drift
- when actual state is not the same as saved state (the resource was changed outside of terraform)
- Check current tag:
```
aws s3api get-bucket-tagging --bucket bucket1-vek26tno
{
    "TagSet": [
        {
            "Key": "Name",
            "Value": "bucket1"
        }
    ]
}
```
- change tag outside of terraform
```
aws s3api put-bucket-tagging --bucket bucket1-vek26tno --tagging 'TagSet=[{Key=Name,Value=bucket1-DRIFF}]'

aws s3api get-bucket-tagging --bucket bucket1-vek26tno
{
    "TagSet": [
        {
            "Key": "Name",
            "Value": "bucket1-DRIFF"
        }
    ]
}
```

- run tf plan
![tf plan](./image-6.png)

- run tf apply
```
terraform apply -auto-approve
aws s3api get-bucket-tagging --bucket bucket1-vek26tno
{
    "TagSet": [
        {
            "Key": "Name",
            "Value": "bucket1"
        }
    ]
}
```

