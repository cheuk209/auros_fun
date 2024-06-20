variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type = string
    default = "ami-0551ce4d67096d606"
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro" # free tier available
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Company = "Auros"
  }
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with the instance"
  type        = string
}