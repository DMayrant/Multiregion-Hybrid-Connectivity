module "tgw" {
  source = "../../modules/tgw"

  env                = var.env
  region             = "eu-west-2"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets
}