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
  description = "AWS region for this environment"
  type        = string
}

variable "ami_id" {
  type = string
}