
############################################
# Environment
############################################

variable "env" {
  description = "Deployment environment"
  type        = string
}

############################################
# VPC
############################################

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

############################################
# Availability Zones
############################################

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
}

############################################
# Public Subnets
############################################

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

############################################
# Private Subnets
############################################

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

############################################
# Flow Logs
############################################

variable "flow_logs_bucket_arn" {
  description = "S3 bucket ARN for VPC Flow Logs"
  type        = string
}