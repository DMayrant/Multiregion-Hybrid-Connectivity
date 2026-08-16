output "web_acl_arn" {
  value = aws_wafv2_web_acl.alb_waf.arn
}

output "web_acl_id" {
  value = aws_wafv2_web_acl.alb_waf.id
}

output "web_acl_name" {
  value = aws_wafv2_web_acl.alb_waf.name
}