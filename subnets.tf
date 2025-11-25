resource "aws_subnet" "pub_sub_1" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.pub_sub_1_cidr

  tags = {
    Name = "${var.vpc_name}-pub-sub-1"
    Environment = var.environment
  }
}

resource "aws_subnet" "pub_sub_2" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.pub_sub_2_cidr

  tags = {
    Name = "${var.vpc_name}-pub-sub-2"
    Environment = var.environment
  }
}