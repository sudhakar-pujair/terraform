terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.22.1"
    }
  }
  # backend "s3" {
  #   bucket       = "devsecopsb49tfstate"
  #   key          = "class/terraform.tfstate"
  #   region       = "us-east-1"
  #   use_lockfile = true # This line enables S3 native locking
  #   #dynamodb_table = "devsecopsb49_terraform_state_lock"
  #   encrypt = true
  # }
}

provider "aws" {
  region = var.region
}
