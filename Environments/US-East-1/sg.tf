module "security_groups" {
  source = "../../modules/security-group"

  env      = var.env
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = module.vpc.vpc_cidr_block
}