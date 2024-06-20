# auros_fun

## Objective 
Create a Terraform module that provisions an EC2 instance and a KMS
encrypted SSM secret. The secret should contain data that can be configured via Terraform
variables.
## Requirements:
* Include an IAM instance profile and associated policy that allows the EC2 instance to
read and decrypt the SSM secret but restricts other IAM actions.
* The secret data should be configurable through Terraform variables.
* Ensure all resources are appropriately tagged.

## Steps:
I wanted to focus on building the first EC2 instance, before working on SSM. 

AWS CLI, terraform, tflint already installed on my local machine.


## 1. Setting Up the Environment
Initialize Terraform.
Not using S3 bucket for back ups, since I am not actually creating anything on Cloud. Backend is stored locally, but omitted using git ignore! 
I began by initializing the Terraform environment to manage our AWS resources. This step ensures that all necessary plugins and modules are ready for use

## 2. Define the EC2 Instance
Create a minimal EC2 Module

I defined a minimalistic Terraform module to provision an EC2 instance. This module included essential parameters such as the AMI ID, instance type, key name, and tags.

## 3. IAM Role and Instance Profile
Create IAM Role with Necessary Permissions

I created an IAM role with policies allowing the EC2 instance to access and decrypt KMS-encrypted SSM parameters. This ensures that the instance has the necessary permissions to securely retrieve secrets.

I then attached the IAM role to the EC2 instance via an instance profile. This allows the EC2 instance to automatically use the IAM role's permissions without manual configuration.

## 4. Define KMS Key and SSM Parameter

I created a KMS key to encrypt the SSM parameter. This step ensures that the secret is stored securely and can only be accessed by entities with the correct permissions.

I created an SSM parameter to store the secret, specifying the KMS key for encryption. This allows us to manage secrets securely within AWS.

## 5. Terraform validate

This is the step to ensure all of my terraform configs and formats are correct. I ran `terraform validate` as well as `tflint` to look for errors in my code. 

## 6. Accessing the SSM Parameter

I would use the AWS CLI to retrieve the KMS-encrypted SSM parameter from the EC2 instance. This step would verify that the instance can securely access and decrypt the secret as intended

```aws ssm get-parameter --name "my_secret_parameter" --with-decryption --query "Parameter.Value" --output text --region "eu-west-1"```

EC2 instance should be able to retrieve the secret value.