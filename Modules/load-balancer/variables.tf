variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "alb_security_group_id" {
  type = string
}

variable "alb_logs_bucket" {
  type = string
}