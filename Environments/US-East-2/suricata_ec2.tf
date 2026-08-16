module "suricata_ec2" {
  source = "../../modules/compute/ec2"

  env           = var.env
  instance_name = "suricata-ids"

  instance_type = var.instance_type

  subnet_id = module.vpc.private_subnets[0]

  security_group_ids = [
    module.security_groups.suricata_sg_id
  ]

  iam_instance_profile_name = data.aws_iam_instance_profile.ec2_profile.name

  user_data = file("${path.module}/Suricata/suricata.sh")

  root_volume_size = 30
}