# AWS EC2 with Docker and SonarQube deployed using Terraform - Repo by Raghu

Helpful Terraform Links:
- [Terraform Language Documentation](https://www.terraform.io/docs/language/index.html)
- [Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- [Resource: aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

## Prerequisites

Before proceeding with the Terraform Steps, ensure you have completed the following steps:

- **Find VPC ID:**
  - Locate the VPC Id in your specific AWS region where you plan to deploy the resources.
  - Update the name of the VPC Id in the `dev-west-2.tfvars` file.

- **Generate a Key Pair:**
  - Create a new key pair (.pem file) in the AWS Management Console.
  - Download the .pem file to your local machine and place it at the root of this repo.
  - Update the name of the key pair file in the `dev-west-2.tfvars` file to reflect the name of your downloaded key pair.


## Step 0: Initialize Terraform
```
terraform init
```

## Step 1: Plan Resources
```
terraform plan -var-file="vars/dev-west-2.tfvars"
```

## Step 2: Apply Resources
```
terraform apply -var-file="vars/dev-west-2.tfvars"
```

## Step 3: Cleanup Terraform Resources
```
terraform destroy -var-file="vars/dev-west-2.tfvars"
