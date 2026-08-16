module "tgw" {
  source = "../../modules/tgw"

  env                = var.env
  region             = "us-east-1"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets
}