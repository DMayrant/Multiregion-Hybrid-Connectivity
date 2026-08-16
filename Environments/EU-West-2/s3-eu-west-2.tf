module "s3_regional" {
  source = "../../Modules/s3-regional"

  env        = var.env
  aws_region = var.aws_region
}