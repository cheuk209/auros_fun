output "instance_id" {
    description = "ID of EC2 Instance"
    value = module.ec2_instance.instance_id
}

output "public_ip" {
    description = "public IP address of the EC2 instance"
    value = module.ec2_instance.public_ip
}

output "private_ip" {
    description = "private IP address of the EC2 instance"
    value = module.ec2_instance.private_ip
}


output "ssm_parameter_arn" {
  description = "ARN of the SSM parameter"
  value       = aws_ssm_parameter.secret.arn
}

output "kms_key_arn" {
  description = "ARN of the KMS key"
  value       = aws_kms_key.ssm_key.arn
}