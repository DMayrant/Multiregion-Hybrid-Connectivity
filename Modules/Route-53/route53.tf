############################################
# Primary Health Check (US-East-1)
############################################

resource "aws_route53_health_check" "primary" {

  fqdn              = var.primary_health_check_fqdn
  port              = 443
  type              = "HTTPS"
  resource_path     = var.health_check_path
  request_interval  = 30
  failure_threshold = 3

  tags = {
    Name        = "${var.env}-primary-healthcheck"
    Environment = var.env
  }
}

############################################
# Secondary Health Check (EU-West-2)
############################################

resource "aws_route53_health_check" "secondary" {

  fqdn              = var.secondary_health_check_fqdn
  port              = 443
  type              = "HTTPS"
  resource_path     = var.health_check_path
  request_interval  = 30
  failure_threshold = 3

  tags = {
    Name        = "${var.env}-secondary-healthcheck"
    Environment = var.env
  }
}

############################################
# Primary Record
############################################

resource "aws_route53_record" "primary" {

  zone_id = var.hosted_zone_id
  name    = var.record_name
  type    = "A"

  set_identifier = "Primary"

  failover_routing_policy {
    type = "PRIMARY"
  }

  alias {
    name                   = var.primary_alb_dns_name
    zone_id                = var.primary_alb_zone_id
    evaluate_target_health = true
  }

  health_check_id = aws_route53_health_check.primary.id
}

############################################
# Secondary Record
############################################

resource "aws_route53_record" "secondary" {

  zone_id = var.hosted_zone_id
  name    = var.record_name
  type    = "A"

  set_identifier = "Secondary"

  failover_routing_policy {
    type = "SECONDARY"
  }

  alias {
    name                   = var.secondary_alb_dns_name
    zone_id                = var.secondary_alb_zone_id
    evaluate_target_health = true
  }

  health_check_id = aws_route53_health_check.secondary.id
}