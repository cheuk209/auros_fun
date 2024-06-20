provider "aws" {
    region = var.region
}

data "aws_caller_identity" "current" {}

module "ec2_instance" {
    source = "./modules/ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
    tags = var.tags
}
