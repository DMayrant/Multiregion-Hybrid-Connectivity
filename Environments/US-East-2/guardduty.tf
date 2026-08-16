module "guardduty" {
  source = "../../modules/guardduty"

  env = var.env
}