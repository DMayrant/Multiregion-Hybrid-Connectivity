############################################
# Environment
############################################

variable "env" {
  description = "Deployment environment"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}


############################################
# Suricata Bucket
############################################

variable "create_suricata_bucket" {
  description = "Whether to create the Suricata bucket"
  type        = bool
  default     = false
}


############################################
# CIDRs for EKS API
############################################

variable "public_access_cidrs" {
  description = "CIDR blocks allowed to access the EKS API"
  type        = list(string)
}


############################################
# Database Configuration
############################################

variable "engine" {
  description = "Database engine"
  type        = string
}

variable "instance_class" {
  description = "Database instance class"
  type        = string
}

variable "storage_encrypted" {
  description = "Enable database storage encryption"
  type        = bool
}

variable "deletion_protection" {
  description = "Enable database deletion protection"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Skip final database snapshot when deleting"
  type        = bool
}

variable "backup_retention_period" {
  description = "Number of days to retain database backups"
  type        = number
}

variable "apply_immediately" {
  description = "Apply database changes immediately"
  type        = bool
}


############################################
# VPN Configuration
############################################

variable "primary_cgw_public_ip" {
  description = "Public IP address of the primary customer gateway"
  type        = string
}

variable "secondary_cgw_public_ip" {
  description = "Public IP address of the secondary customer gateway"
  type        = string
}

variable "primary_cgw_bgp_asn" {
  description = "BGP ASN for the primary customer gateway"
  type        = number
}

variable "name_prefix" {
  description = "Prefix used for AWS resource names"
  type        = string
}