resource "random_integer" "s3random" {
  min = 10000
  max = 20000
}

locals {
  bucket_name = "${lower(var.bucket_name)}bucket${random_integer.s3random.result}"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name        = local.bucket_name
    Environment = var.env
  }

}
