variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "ssm_log_group_arn" {
  description = "ARN of the Session Manager CloudWatch Log Group"
  type        = string
}
