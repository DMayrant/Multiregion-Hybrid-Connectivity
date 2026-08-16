
output "db_username" {
  value = aws_ssm_parameter.db_username.value
}

output "db_password" {
  value     = random_password.db_password.result
  sensitive = true
}

output "ssm_log_group_arn" {
  description = "ARN of the Session Manager CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.ssm_sessions.arn
}