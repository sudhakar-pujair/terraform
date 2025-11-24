resource "aws_subnet" "public_subnet" {
    vpc_id     = aws_vpc.vpc_dev.id
    cidr_block = var.public_subnet_cidr

    tags = {
      Name = "${lower(var.vpc_name)}-public"
      Environment = lower(var.environment)
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id     = aws_vpc.vpc_dev.id
    cidr_block = var.private_subnet_cidr

    tags = {
      Name = "${lower(var.vpc_name)}-private"
      Environment = lower(var.environment)
    }
}

