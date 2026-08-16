
variable "env" {
  description = "Deployment environment"
  type        = string
}

variable "aws_region" {
  description = "AWS region where the S3 buckets will be created"
  type        = string
}

# EC2 ami id for Ubuntu

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}