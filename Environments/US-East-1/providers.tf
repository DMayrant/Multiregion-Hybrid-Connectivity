terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.50"

    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.0.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }

  }
}
provider "aws" {
  region = "us-east-1"
}

