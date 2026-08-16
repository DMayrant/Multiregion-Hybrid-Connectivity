##################
# DB Subnet Group
##################

variable "env" {
  type = string
}

#################
# Auorora Config
#################

variable "engine" {
  description = "Aurora engine"
  type        = string
}

variable "instance_class" {
  description = "Aurora instance class"
  type        = string
  default     = "db.t3.medium"
}

variable "backup_retention_period" {
  type    = number
  default = 7
}

variable "storage_encrypted" {
  type    = bool
  default = true
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "apply_immediately" {
  type    = bool
  default = true
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

############################################
# Database Credentials
############################################

variable "db_username" {
  description = "Master username"
  type        = string
}

variable "db_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

############################################
# Networking
############################################

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "aurora_security_group_id" {
  description = "Aurora Security Group ID"
  type        = string
}
