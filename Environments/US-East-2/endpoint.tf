module "endpoints" {
  source = "../../modules/Endpoints"

  env                = var.env
  aws_region         = var.aws_region
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets

  endpoint_security_group_id = module.security_groups.ssm_endpoints_sg_id
}