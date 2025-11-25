terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.22.1"
    }
  }
  backend "s3" {
    bucket       = "testterras"
    key          = "test/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true # This line enables S3 native locking
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}
