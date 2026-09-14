module "storage" {
  source = "./modules/storage"

  bucket_name = var.s3_bucket_name
}

module "iam" {
  source = "./modules/iam"

  role_name = var.iam_role_name
}
