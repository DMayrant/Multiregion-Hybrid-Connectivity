terraform {
  backend "s3" {
    bucket       = "devops-tf-state-9711"
    key          = "global/iam/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}

