module "s3" {
  source = "../../Modules/s3"

  env = var.env

  aws_region = var.aws_region

  create_suricata_bucket = var.create_suricata_bucket

  vpc_flow_log_retention_days        = var.vpc_flow_log_retention_days
  alb_log_retention_days             = var.alb_log_retention_days
  session_manager_log_retention_days = var.session_manager_log_retention_days
  suricata_log_retention_days        = var.suricata_log_retention_days
}