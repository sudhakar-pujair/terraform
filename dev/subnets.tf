resource "aws_subnet" "public_subnet_1" {
    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = var.public_sub_cidr_1

    tags = {
      Name = "${lower(var.vpc_name)}-public-sub-1"
      Environment = lower(var.environment)
    }
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = var.public_sub_cidr_2

    tags = {
      Name = "${lower(var.vpc_name)}-public-sub-2"
      Environment = lower(var.environment)
    }
}

resource "aws_subnet" "public_subnet_3" {
    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = var.public_sub_cidr_3

    tags = {
      Name = "${lower(var.vpc_name)}-public-sub-3"
      Environment = lower(var.environment)
    }
}