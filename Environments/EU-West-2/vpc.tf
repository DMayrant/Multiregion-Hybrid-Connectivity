module "vpc" {
  source = "../../modules/vpc"

  env = var.env

  vpc_cidr = "10.123.0.0/16"

  availability_zones = [
    "eu-west-2a",
    "eu-west-2b",
    "eu-west-2c"
  ]

  public_subnet_cidrs = [
    "10.123.10.0/24",
    "10.123.11.0/24",
    "10.123.12.0/24"
  ]

  private_subnet_cidrs = [
    "10.123.100.0/24",
    "10.123.110.0/24",
    "10.123.120.0/24"
  ]

  flow_logs_bucket_arn = data.terraform_remote_state.s3.outputs.vpc_logs_bucket_arn
}