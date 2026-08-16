output "primary_health_check_id" {
  description = "Primary Route53 Health Check ID"

  value = aws_route53_health_check.primary.id
}

output "secondary_health_check_id" {
  description = "Secondary Route53 Health Check ID"

  value = aws_route53_health_check.secondary.id
}

output "primary_record_fqdn" {
  description = "Primary DNS Record"

  value = aws_route53_record.primary.fqdn
}

output "secondary_record_fqdn" {
  description = "Secondary DNS Record"

  value = aws_route53_record.secondary.fqdn
}