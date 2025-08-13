# Use s3 backend

## Config
- Locking can be enabled via S3 or DynamoDB. However, DynamoDB-based locking is deprecated and will be removed in a future minor version.
- config.tf
```hcl
terraform {
  backend "s3" {
    bucket = "project-1-terrarform-bucket-1"
    use_path_style = true # Required for LocalStack
    key = "project-2-key"
    region = "us-east-1"
    use_lockfile = true # enable s3 state locking
    encrypt = true
    # dynamodb_table = "project-1-terraform-lock-table" # deprecated
  }
}
```

## Run terraform

```sh
terraform init
terraform plan
terraform apply -auto-approve
```

```sh
aws s3 ls project-1-terrarform-bucket-1
# 2025-08-10 23:58:06       6908 project-2-key


# show content of the state file
aws s3 cp  s3://project-1-terrarform-bucket-1/project-2-key -
```

```json
{
  "version": 4,
  "terraform_version": "1.12.2",
  "serial": 1,
  "lineage": "c37047f7-70cd-8cce-cef4-1cbf099a66bf",
  "outputs": {
    "public_ip": {
      "value": "54.214.160.212",
      "type": "string"
    }
  },
  "resources": [
    {
      "mode": "data",
      "type": "aws_ami",
      "name": "ubuntu1404",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "allow_unsafe_filter": null,
            "architecture": "x86_64",
            "arn": "arn:aws:ec2:us-east-1::image/ami-1e749f67",
            "block_device_mappings": [
              {
                "device_name": "/dev/sda1",
                "ebs": {
                  "delete_on_termination": "false",
                  "encrypted": "false",
                  "iops": "0",
                  "snapshot_id": "snap-28a2b44c63018d750",
                  "throughput": "0",
                  "volume_initialization_rate": "0",
                  "volume_size": "15",
                  "volume_type": "standard"
                },
                "no_device": "",
                "virtual_name": ""
              }
            ],
            "boot_mode": "",
            "creation_date": "2025-08-09T12:18:10.000Z",
            "deprecation_time": "",
            "description": "Canonical, Ubuntu, 14.04 LTS, amd64 trusty image build on 2017-07-27",
            "ena_support": false,
            "executable_users": null,
            "filter": [
              {
                "name": "name",
                "values": [
                  "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
                ]
              }
            ],
            "hypervisor": "xen",
            "id": "ami-1e749f67",
            "image_id": "ami-1e749f67",
            "image_location": "amazon/getting-started",
            "image_owner_alias": "amazon",
            "image_type": "machine",
            "imds_support": "",
            "include_deprecated": false,
            "kernel_id": "None",
            "last_launched_time": "",
            "most_recent": true,
            "name": "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-20170727",
            "name_regex": null,
            "owner_id": "099720109477",
            "owners": [
              "099720109477"
            ],
            "platform": "",
            "platform_details": "",
            "product_codes": [],
            "public": true,
            "ramdisk_id": "ari-1a2b3c4d",
            "region": "us-east-1",
            "root_device_name": "/dev/sda1",
            "root_device_type": "ebs",
            "root_snapshot_id": "snap-28a2b44c63018d750",
            "sriov_net_support": "",
            "state": "available",
            "state_reason": {
              "code": "UNSET",
              "message": "UNSET"
            },
            "tags": {},
            "timeouts": null,
            "tpm_support": "",
            "uefi_data": null,
            "usage_operation": "",
            "virtualization_type": "hvm"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_instance",
      "name": "instance_9",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 2,
          "attributes": {
            "ami": "ami-1e749f67",
            "arn": "arn:aws:ec2:us-east-1:000000000000:instance/i-9062a2a28dfcb7f01",
            "associate_public_ip_address": true,
            "availability_zone": "us-east-1a",
            "capacity_reservation_specification": [],
            "cpu_options": [],
            "credit_specification": [],
            "disable_api_stop": false,
            "disable_api_termination": false,
            "ebs_block_device": [],
            "ebs_optimized": false,
            "enable_primary_ipv6": null,
            "enclave_options": [],
            "ephemeral_block_device": [],
            "force_destroy": false,
            "get_password_data": false,
            "hibernation": false,
            "host_id": "",
            "host_resource_group_arn": null,
            "iam_instance_profile": "",
            "id": "i-9062a2a28dfcb7f01",
            "instance_initiated_shutdown_behavior": "stop",
            "instance_lifecycle": "",
            "instance_market_options": [],
            "instance_state": "running",
            "instance_type": "t2.micro",
            "ipv6_address_count": 0,
            "ipv6_addresses": [],
            "key_name": "",
            "launch_template": [],
            "maintenance_options": [],
            "metadata_options": [],
            "monitoring": false,
            "network_interface": [],
            "outpost_arn": "",
            "password_data": "",
            "placement_group": "",
            "placement_partition_number": 0,
            "primary_network_interface_id": "eni-5af5aa43dd1996ca8",
            "private_dns": "ip-10-13-152-254.ec2.internal",
            "private_dns_name_options": [],
            "private_ip": "10.13.152.254",
            "public_dns": "ec2-54-214-160-212.compute-1.amazonaws.com",
            "public_ip": "54.214.160.212",
            "region": "us-east-1",
            "root_block_device": [
              {
                "delete_on_termination": true,
                "device_name": "/dev/sda1",
                "encrypted": false,
                "iops": 0,
                "kms_key_id": "",
                "tags": {},
                "tags_all": {},
                "throughput": 0,
                "volume_id": "vol-940446b0823b46ef8",
                "volume_size": 8,
                "volume_type": "gp2"
              }
            ],
            "secondary_private_ips": [],
            "security_groups": [],
            "source_dest_check": true,
            "spot_instance_request_id": "",
            "subnet_id": "subnet-c5300f81f76ace3a3",
            "tags": {
              "Name": "instance_9"
            },
            "tags_all": {
              "Name": "instance_9"
            },
            "tenancy": "default",
            "timeouts": null,
            "user_data": null,
            "user_data_base64": null,
            "user_data_replace_on_change": false,
            "volume_tags": null,
            "vpc_security_group_ids": []
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwicmVhZCI6OTAwMDAwMDAwMDAwLCJ1cGRhdGUiOjYwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMiJ9",
          "dependencies": [
            "data.aws_ami.ubuntu1404"
          ]
        }
      ]
    }
  ],
  "check_results": null
}
```


### state file and lock file
```sh
aws s3api list-object-versions --bucket project-1-terrarform-bucket-1 --query "Versions[].{Name: Key, Version: VersionId}" --output table
# --------------------------------------------------------------
# |                     ListObjectVersions                     |
# +-----------------------+------------------------------------+
# |         Name          |              Version               |
# +-----------------------+------------------------------------+
# |  project-2-key        |  AZiU6pufmD.vX5Kv8Q_UvaclLTYlIYLx  |
# |  project-2-key.tflock |  AZiU6puhsiN1_8.q2kV5Ur0VmjWhOCmJ  |
# |  project-2-key.tflock |  AZiU6pueNj32wo5JvxHPL9xxoEYZatjW  |
# |  project-2-key.tflock |  AZiU6pucvJb3z5V6mKhER37V_1MNhmmd  |
# +-----------------------+------------------------------------+
```