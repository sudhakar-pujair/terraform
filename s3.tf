resource "random_integer" "s3random" {
  min = 10000
  max = 20000
}

locals {
  bucket_name = "${var.bucket_name}bucket${random_integer.s3random.result}"
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name        = local.bucket_name
    Environment = var.env
  }

  lifecycle {
    precondition {
      condition     = local.bucket_name == lower(local.bucket_name)
      error_message = "Bucket prefix must be lowercase."
    }
    # precondition {
    #   condition     = alltrue([length(local.bucket_name) > 14, length(local.bucket_name) < 21])
    #   error_message = "The Length of Bucket Name Must Be Between 15 to 20."
    # }
    # precondition {
    #   condition     = contains(["dev", "DEV", "prod", "PROD"], var.env)
    #   error_message = "The Bucket Is Not Allowed To Be Created In Environment ${var.env}"
    # }
    # precondition {
    #   condition     = anytrue([var.env == "dev", var.env == "DEV", var.env == "prod", var.env == "PROD"])
    #   error_message = "The Environment Must be Dev or Prod"
    # }
  }
}
