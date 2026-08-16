module "vpc" {
  source = "../../modules/vpc"

  env = var.env

  vpc_cidr = "10.119.0.0/16"

  availability_zones = [
    "us-east-2a",
    "us-east-2b",
    "us-east-2c"
  ]

  public_subnet_cidrs = [
    "10.119.10.0/24",
    "10.119.12.0/24",
    "10.119.14.0/24"
  ]

  private_subnet_cidrs = [
    "10.119.100.0/24",
    "10.119.105.0/24",
    "10.119.110.0/24"
  ]
  flow_logs_bucket_arn = module.s3_regional.vpc_logs_bucket_arn
}