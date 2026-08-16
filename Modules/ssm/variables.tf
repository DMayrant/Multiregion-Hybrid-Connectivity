variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "s3_bucket_name" {
  description = "S3 bucket used for SSM Session Manager logs"
  type        = string
}