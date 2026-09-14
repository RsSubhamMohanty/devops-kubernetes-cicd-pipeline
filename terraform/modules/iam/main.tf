resource "aws_iam_role" "this" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::000000000000:root"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}
