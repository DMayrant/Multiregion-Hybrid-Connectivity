############################################
# Environment
############################################

variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

############################################
# VPC
############################################

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
}