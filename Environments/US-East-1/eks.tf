module "eks" {
  source = "../../modules/compute/eks"

  env = var.env

  cluster_role_arn = data.terraform_remote_state.iam.outputs.cluster_role_arn
  node_role_arn    = data.terraform_remote_state.iam.outputs.node_role_arn

  private_subnet_ids        = module.vpc.private_subnets
  cluster_security_group_id = module.security_groups.eks_cluster_sg_id

  ############################################
  # Kubernetes
  ############################################

  kubernetes_version      = "1.34"
  endpoint_private_access = true
  endpoint_public_access  = true

  public_access_cidrs = var.public_access_cidrs

  ############################################
  # Worker Nodes
  ############################################

  ami_type       = "AL2023_x86_64_STANDARD"
  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.xlarge"]

  desired_size = 6
  min_size     = 5
  max_size     = 15

  max_unavailable = 1
}