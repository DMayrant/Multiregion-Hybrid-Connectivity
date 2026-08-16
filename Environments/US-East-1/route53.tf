/*
module "route53" {

  source = "../../modules/route53"

  env = var.env

  hosted_zone_id = var.hosted_zone_id
  record_name    = "app.example.com"

  health_check_path = "/health"

  primary_health_check_fqdn = module.alb_primary.alb_dns_name
  secondary_health_check_fqdn = module.alb_dr.alb_dns_name

  primary_alb_dns_name = module.alb_primary.alb_dns_name
  primary_alb_zone_id  = module.alb_primary.alb_zone_id

  secondary_alb_dns_name = module.alb_dr.alb_dns_name
  secondary_alb_zone_id  = module.alb_dr.alb_zone_id
}
*/