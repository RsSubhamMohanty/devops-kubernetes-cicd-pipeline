variable "aws_region" {
  description = "AWS region used by the local Floci environment."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name used for Terraform-managed resources."
  type        = string
  default     = "local"
}

variable "s3_bucket_name" {
  description = "Name of the Terraform-managed S3 bucket."
  type        = string
}

variable "iam_role_name" {
  description = "Name of the Terraform-managed IAM role."
  type        = string
}
