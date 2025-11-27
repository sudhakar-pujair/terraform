resource "random_integer" "s3random" {
  min = 10000
  max = 20000
}

locals {
  bucket_name = "${lower(var.bucket_name)}bucket${random_integer.s3random.result}"
  env_lower   = lower(var.env)
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name        = local.bucket_name
    Environment = local.env_lower
  }

  lifecycle {
    precondition {
      condition     = local.bucket_name == lower(local.bucket_name)
      error_message = "Bucket prefix must be lowercase."
    }

    precondition {
      condition     = alltrue([length(local.bucket_name) >= 15, length(local.bucket_name) <= 20])
      error_message = "The bucket name length must be between 15 and 20 characters."
    }

    precondition {
      condition     = local.env_lower == "dev" || local.env_lower == "prod"
      error_message = "The environment must be 'dev' or 'prod'."
    }
  }
}
