provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.0.2"

  backend "s3" {
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60"
    }
  }
}
