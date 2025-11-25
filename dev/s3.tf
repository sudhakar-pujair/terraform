resource "aws_s3_bucket" "backup" {
  bucket = var.aws_s3_bucket
  region = var.region

  tags = {
    Name = "${var.vpc_name}-backup"
    Environment = var.environment
  }
}