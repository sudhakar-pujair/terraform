resource "aws_vpc" "vpc_dev" {
  cidr_block       = var.vpc_dir
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = lower(var.vpc_name)
    Environment = lower(var.environment)
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = lower(var.igw_name)
    Environment = lower(var.igw_name)
  }
}