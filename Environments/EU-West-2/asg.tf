module "asg" {
  source = "../../modules/compute/asg"

  env              = var.env
  min_size         = 2
  max_size         = 25
  desired_capacity = 5

  private_subnet_ids = module.vpc.private_subnets
  target_group_arn   = module.alb.target_group_arn

  # Launch Template
  ami_id                     = data.aws_ami.ubuntu.id
  instance_type              = "t3.medium"
  instance_security_group_id = module.security_groups.web_sg_id
  instance_profile_name      = data.aws_iam_instance_profile.ec2_profile.name

  health_check_grace_period = 120
}