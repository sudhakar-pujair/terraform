## VPC

resource "aws_vpc" "test_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name        = var.vpc_name
    Environment = var.env
  }
}

## Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name        = "${var.vpc_name}-igw"
    Environment = var.env
  }
}

## Public Subnets

resource "aws_subnet" "public_subnets" {
  # count = 2
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = element(var.public_subnet_cidrs,count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-prublic-subnet-${count.index + 1}"
    Environment = var.env
  }
}

## Private Subnets

resource "aws_subnet" "private_subnets" {
  # count = 2
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = element(var.private_subnet_cidrs,count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-private-subnet-${count.index + 1}"
    Environment = var.env
  }
}

## Public Route Table

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

resource "aws_route_table_association" "public_subnets_rt" {
  # count = 2
  count           = length(var.public_subnet_cidrs)
  subnet_id       = element(aws_subnet.public_subnets[*].id,count.index)
  route_table_id  = aws_route_table.public_rt.id
}

## Private Route Table

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name        = "${var.vpc_name}-private_rt"
    Environment = var.env
  }
}

resource "aws_route_table_association" "private_subnets_rt" {
  count           = length(var.private_subnet_cidrs)
  subnet_id       = element(aws_subnet.private_subnets[*].id,count.index)
  route_table_id  = aws_route_table.private_rt.id
}