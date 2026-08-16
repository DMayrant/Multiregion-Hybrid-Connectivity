############################################
# Environment
############################################

variable "env" {
  description = "Deployment environment"
  type        = string
}

############################################
# AWS Region
############################################

variable "aws_region" {
  description = "AWS region used by the provider"
  type        = string
}

############################################
# Suricata
############################################

variable "create_suricata_bucket" {
  description = "Create the Suricata logs bucket"
  type        = bool
}

############################################
# Lifecycle Policies
############################################

variable "vpc_flow_log_retention_days" {
  description = "Retention period for VPC Flow Logs"
  type        = number
}

variable "alb_log_retention_days" {
  description = "Retention period for ALB Access Logs"
  type        = number
}

variable "session_manager_log_retention_days" {
  description = "Retention period for Session Manager logs"
  type        = number
}

variable "suricata_log_retention_days" {
  description = "Retention period for Suricata logs"
  type        = number
}