resource "aws_subnet" "public_subnet" {
    vpc_id     = aws_vpc.vpc_dev.id
    cidr_block = var.public_subnet_cidr

    tags = {
      Name = lower(var.public_sub_name)
      Environment = lower(var.environment)
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id     = aws_vpc.vpc_dev.id
    cidr_block = var.private_subnet_cidr

    tags = {
      Name = lower(var.private_sub_name)
      Environment = lower(var.environment)
    }
}

