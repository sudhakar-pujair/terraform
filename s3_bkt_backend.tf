resource "random_integer" "s3suffix" {
    min = 1000
    max = 3000
}

resource "aws_s3_bucket" "bucket_backend" {
  region = "us-east-1"
  bucket = "terraform-${random_integer.s3suffix.result}"
  force_destroy = true
  tags = {
    Name        = "terraform-${random_integer.s3suffix.result}"
    Environment = "test"
  }
}

output "bucket_id" {
    value = aws_s3_bucket.bucket_backend.id
}

output "bucket_arn" {
    value = aws_s3_bucket.bucket_backend.arn
}