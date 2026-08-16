module "vpc" {
  source = "../../modules/vpc"

  env = var.env

  vpc_cidr = "10.117.0.0/16"

  availability_zones = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]

  public_subnet_cidrs = [
    "10.117.10.0/24",
    "10.117.11.0/24",
    "10.117.12.0/24"
  ]

  private_subnet_cidrs = [
    "10.117.100.0/24",
    "10.117.110.0/24",
    "10.117.120.0/24"
  ]

  flow_logs_bucket_arn = data.terraform_remote_state.s3.outputs.vpc_logs_bucket_arn
}