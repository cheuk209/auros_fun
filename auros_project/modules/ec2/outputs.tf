output "instance_id" {
    description = "ID of EC2 Instance"
    value = aws_instance.instance.id
}

output "public_ip" {
    description = "public IP address of the EC2 instance"
    value = aws_instance.instance.public_ip
}

output "private_ip" {
    description = "private IP address of the EC2 instance"
    value = aws_instance.instance.private_ip
}
