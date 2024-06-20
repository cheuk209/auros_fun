resource "aws_kms_key" "ssm_key" {
  description = "KMS key for SSM secret encryption"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${aws_iam_role.ec2_role.name}"
        }
        Action    = [
            "kms:Decrypt",
            "kms:Encrypt",
            "kms:GenerateDataKey"
        ]
        Resource  = "*"
      },
    ]
  })
  tags = merge(
        var.tags,
        {
            Name = "ssmKey"
        }
    )
}

resource "aws_ssm_parameter" "secret" {
  name  = "my_secret_parameter"
  type  = "SecureString"
  value = var.ssm_parameter_secret
  key_id = aws_kms_key.ssm_key.arn
  tags = merge(
        var.tags,
        {
            Name = "ssmSecret"
        }
    )
}
