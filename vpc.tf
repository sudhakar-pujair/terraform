resource "aws_vpc" "test_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name        = var.vpc_name
    Environment = var.env
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name        = "${var.vpc_name}-igw"
    Environment = var.env
  }
}

resource "aws_subnet" "public_sub_1" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.pub_sub_1_cidr

  tags = {
    Name        = "${var.vpc_name}-public_sub_1"
    Environment = var.env
  }

}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.vpc_name}-public_rt"
    Environment = var.env
  }
}

resource "aws_route_table_association" "public_rt_1" {
  subnet_id      = aws_subnet.public_sub_1.id
  route_table_id = aws_route_table.public_rt.id
}