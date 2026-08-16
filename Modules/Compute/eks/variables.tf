############################################
# Environment
############################################

variable "env" {
  description = "Deployment environment"
  type        = string
}

############################################
# IAM
############################################

variable "cluster_role_arn" {
  description = "IAM role ARN for the EKS control plane"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for the EKS worker nodes"
  type        = string
}

############################################
# Networking
############################################

variable "private_subnet_ids" {
  description = "Private subnet IDs for EKS"
  type        = list(string)
}

variable "cluster_security_group_id" {
  description = "Security group ID for the EKS control plane"
  type        = string
}

############################################
# Kubernetes
############################################

variable "kubernetes_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.29"
}

variable "endpoint_private_access" {
  description = "Enable private endpoint access"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Enable public endpoint access"
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "CIDRs allowed to access the Kubernetes API"
  type        = list(string)
  default = ["71.105.19.72/32"]
}

############################################
# Worker Nodes
############################################

variable "ami_type" {
  description = "AMI type for EKS worker nodes"
  type        = string
  default     = "AL2023_x86_64_STANDARD"
}

variable "capacity_type" {
  description = "ON_DEMAND or SPOT"
  type        = string
  default     = "ON_DEMAND"
}

variable "instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.xlarge"]
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 6
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 5
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 15
}

variable "max_unavailable" {
  description = "Maximum unavailable nodes during an update"
  type        = number
  default     = 1
}