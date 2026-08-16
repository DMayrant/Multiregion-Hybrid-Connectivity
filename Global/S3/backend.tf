terraform {
  backend "s3" {
    bucket       = "devops-tf-state-9711"
    key          = "global/S3/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
