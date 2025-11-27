resource "random_integer" "s3random" {
  min = 10000
  max = 20000
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket        = "${var.bucket_name}bucket${random_integer.s3random.result}"
  force_destroy = true

  tags = {
    Name        = "${var.bucket_name}bucket${random_integer.s3random.result}"
    Environment = var.env
  }

  lifecycle {
    precondition {
      condition     = "${var.bucket_name}bucket${random_integer.s3random.result}" == lower("${var.bucket_name}bucket${random_integer.s3random.result}")
      error_message = "Bucket prefix must be lowercase."
    }
    precondition {
      condition     = alltrue([length("${var.bucket_name}bucket${random_integer.s3random.result}") > 14, length("${var.bucket_name}bucket${random_integer.s3random.result}") < 21])
      error_message = "The Length of Bucket Name Must Be Between 15 to 20."
    }
    precondition {
      condition     = contains(["dev", "DEV", "prod", "PROD"], var.env)
      error_message = "The Bucket Is Not Allowed To Be Created In Environment ${var.env}"
    }
    precondition {
      condition     = anytrue([var.env == "dev", var.env == "DEV", var.env == "prod", var.env == "PROD"])
      error_message = "The Environment Must be Dev or Prod"
    }
  }
}
