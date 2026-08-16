variable "env" {
  type = string
}

variable "hosted_zone_id" {
  type = string
}

variable "record_name" {
  type = string
}

############################################
# Health Checks
############################################

variable "primary_health_check_fqdn" {
  type = string
}

variable "secondary_health_check_fqdn" {
  type = string
}

variable "health_check_path" {
  type    = string
  default = "/"
}

############################################
# Primary ALB
############################################

variable "primary_alb_dns_name" {
  type = string
}

variable "primary_alb_zone_id" {
  type = string
}

############################################
# Secondary ALB
############################################

variable "secondary_alb_dns_name" {
  type = string
}

variable "secondary_alb_zone_id" {
  type = string
}