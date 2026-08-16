output "cluster_role_arn" {
  description = "EKS Cluster IAM Role ARN"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "node_role_arn" {
  description = "EKS Worker Node IAM Role ARN"
  value       = aws_iam_role.eks_node_role.arn
}

output "ec2_ssm_role_arn" {
  description = "EC2 SSM IAM Role ARN"
  value       = aws_iam_role.ec2_ssm_role.arn
}

output "ec2_instance_profile_name" {
  description = "EC2 Instance Profile Name"
  value       = aws_iam_instance_profile.ec2_profile.name
}

output "ec2_instance_profile_arn" {
  description = "EC2 Instance Profile ARN"
  value       = aws_iam_instance_profile.ec2_profile.arn
}