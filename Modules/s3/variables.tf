############################################
# Environment
############################################

variable "env" {
  description = "Deployment environment"
  type        = string
}

############################################
# Lifecycle Policies
############################################

variable "vpc_flow_log_retention_days" {
  description = "Retention period for VPC Flow Logs"
  type        = number
  default     = 90
}

variable "alb_log_retention_days" {
  description = "Retention period for ALB Access Logs"
  type        = number
  default     = 90
}

variable "suricata_log_retention_days" {
  description = "Retention period for Suricata logs"
  type        = number
  default     = 365
}

variable "session_manager_log_retention_days" {
  description = "Retention period for Session Manager logs"
  type        = number
  default     = 90
}

variable "create_suricata_bucket" {
  description = "Create S3 bucket for Suricata logs"
  type        = bool
  default     = false
}


variable "aws_region" {
  description = "AWS region where the S3 buckets will be created"
  type        = string
}