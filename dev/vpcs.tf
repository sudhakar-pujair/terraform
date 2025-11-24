resource "aws_vpc" "terraform_vpc" {
    cidr_block = var.vpc_cidr
    
    tags = {
      Name = lower(var.vpc_name)
      Environment = lower(var.environment)
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.terraform_vpc.id

    tags = {
        Name = "${lower(var.vpc_name)}-igw"
        Environment = lower(var.environment)
    }
}