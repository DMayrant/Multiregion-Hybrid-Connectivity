module "alb" {
  source = "../../modules/load-balancer"

  env = var.env

  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets

  alb_security_group_id = module.security_groups.alb_sg_id
  alb_logs_bucket       = data.terraform_remote_state.s3.outputs.alb_logs_bucket_name
}