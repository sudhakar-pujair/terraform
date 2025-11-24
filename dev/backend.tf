# resource "random_integer" "s3suffix" {
#     min = 1000
#     max = 3000
# }

resource "aws_s3_bucket" "bucket_backend" {
  bucket = lower(var.s3_bkt_name)
  region = var.region
  force_destroy = true
  tags = {
    # Name        = "terraform-${random_integer.s3suffix.result}"
    Name        = lower(var.s3_bkt_name)
    Environment = lower(var.environment)
  }
}

output "bucket_id" {
    value = aws_s3_bucket.bucket_backend.id
}

output "bucket_arn" {
    value = aws_s3_bucket.bucket_backend.arn
}