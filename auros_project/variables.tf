variable "region" {
    description = "AWS region to deploy resources"
    type = string
    default = "eu-west-1"
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "ami_id" {
    description = "AMI ID for EC2 instance"
    type = string
    default = "ami-0551ce4d67096d606"
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}

variable "ssm_parameter_secret" {
    description = "SSM parameter secret string"
    type = string
    default = "PleaseHireMe"
}

variable "subnet_id" {
    description = "The subnet ID to launch the instance"
    type = string
    default = "subnet-06b572d0671f71e5b"
}

variable "security_group_id" {
    description = "security group ID"
    type = string
    default = "sg-062c7e85e3fd1fea9"
}


variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}


variable "tags" {
    description = "Tags to apply to all resources"
    type = map(string)
    default = {
        Resource = "auros"
    }
}