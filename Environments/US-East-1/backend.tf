terraform {
  backend "s3" {
    bucket       = "devops-tf-state-9711"
    key          = "prod/us-east-1/networking/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}

data "terraform_remote_state" "s3" {
  backend = "s3"

  config = {
    bucket = "devops-tf-state-9711"
    key    = "global/S3/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "iam" {
  backend = "s3"

  config = {
    bucket = "devops-tf-state-9711"
    key    = "global/iam/terraform.tfstate"
    region = "us-east-1"
  }
}