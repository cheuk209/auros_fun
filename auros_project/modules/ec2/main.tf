resource "aws_instance" "instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    iam_instance_profile = var.iam_instance_profile
    tags = merge(
        var.tags,
        {
            Name = "EC2Instance"
        }
    )
}
