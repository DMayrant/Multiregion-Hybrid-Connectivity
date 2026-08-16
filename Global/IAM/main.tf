module "iam" {
  source = "../../Modules/IAM"

  env               = var.env
  ssm_log_group_arn = var.ssm_log_group_arn
}