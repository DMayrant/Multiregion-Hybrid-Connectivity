output "cluster_role_arn" {
  value = module.iam.cluster_role_arn
}

output "node_role_arn" {
  value = module.iam.node_role_arn
}

output "ec2_ssm_role_arn" {
  value = module.iam.ec2_ssm_role_arn
}

output "ec2_instance_profile_name" {
  value = module.iam.ec2_instance_profile_name
}

output "ec2_instance_profile_arn" {
  value = module.iam.ec2_instance_profile_arn
}