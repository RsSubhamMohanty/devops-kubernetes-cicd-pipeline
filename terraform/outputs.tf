output "s3_bucket_name" {
  description = "Name of the Terraform-managed S3 bucket."
  value       = module.storage.bucket_name
}

output "s3_bucket_arn" {
  description = "ARN of the Terraform-managed S3 bucket."
  value       = module.storage.bucket_arn
}

output "iam_role_name" {
  description = "Name of the Terraform-managed IAM role."
  value       = module.iam.role_name
}

output "iam_role_arn" {
  description = "ARN of the Terraform-managed IAM role."
  value       = module.iam.role_arn
}
