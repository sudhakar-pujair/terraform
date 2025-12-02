resource "aws_vpc" "dev_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = local.vpcname
    environment = var.environment
  }
}

resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "${local.vpcname}-igw"
  }
}
