resource "aws_s3_bucket" "backup" {
  bucket = var.bucket_name
  region = var.region

  tags = {
    Name = var.bucket_name
    Environment = var.environment
  }
}