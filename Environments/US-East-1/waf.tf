module "waf" {
  source = "../../modules/waf"

  env        = var.env
  aws_region = var.aws_region
  rate_limit = 2000
}