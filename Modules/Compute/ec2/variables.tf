variable "env" {
  type = string
}

variable "instance_name" {
  type    = string
  default = "ubuntu-ec2"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "iam_instance_profile_name" {
  type = string
}

variable "user_data" {
  type    = string
  default = null
}

variable "root_volume_size" {
  type    = number
  default = 20
}
