
module "ssm" {
  source = "../../modules/ssm"

  env    = var.env
  region = var.aws_region

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets

  s3_bucket_name = data.terraform_remote_state.s3.outputs.session_logs_bucket_name
}