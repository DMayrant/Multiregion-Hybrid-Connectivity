##################
# Aurora MySql DB
##################

module "aurora" {
  source = "../../modules/Aurora"

  # Credentials in SSM parameter store
  db_username = module.ssm.db_username
  db_password = module.ssm.db_password

  # Environment 
  env = var.env

  engine = var.engine

  instance_class = var.instance_class

  private_subnet_ids = module.vpc.private_subnets

  aurora_security_group_id = module.security_groups.aurora_sg_id

  storage_encrypted       = var.storage_encrypted
  deletion_protection     = var.deletion_protection
  skip_final_snapshot     = var.skip_final_snapshot
  backup_retention_period = var.backup_retention_period
  apply_immediately       = var.apply_immediately
}

