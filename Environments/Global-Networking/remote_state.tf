############################################
# US-East-1 Networking
############################################

data "terraform_remote_state" "use1" {
  backend = "s3"

  config = {
    bucket = "devops-tf-state-9711"
    key    = "prod/us-east-1/networking/terraform.tfstate"
    region = "us-east-1"
  }
}

############################################
# US-East-2 Networking
############################################

data "terraform_remote_state" "use2" {
  backend = "s3"

  config = {
    bucket = "devops-tf-state-9711"
    key    = "prod/us-east-2/networking/terraform.tfstate"
    region = "us-east-1"
  }
}

############################################
# EU-West-2 Networking
############################################

data "terraform_remote_state" "euw2" {
  backend = "s3"

  config = {
    bucket = "devops-tf-state-9711"
    key    = "prod/eu-west-2/networking/terraform.tfstate"
    region = "us-east-1"
  }
}