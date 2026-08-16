############################################
# Application Load Balancer
############################################

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.alb.arn
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = aws_lb.alb.dns_name
}

output "alb_zone_id" {
  description = "Application Load Balancer Hosted Zone ID"
  value       = aws_lb.alb.zone_id
}

############################################
# Target Group
############################################

output "target_group_arn" {
  description = "Application Target Group ARN"
  value       = aws_lb_target_group.app_tg.arn
}