resource "aws_subnet" "public_subnets" {
  count = length(local.public_cidr)
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = element(local.public_cidr, count.index)
  availability_zone = element(distinct(var.azs), count.index)

  tags = {
    Name = "${local.vpcname}-public-subnet-${count.index + 1}"
    DeployedBy = local.DeployedBy
    Owner = local.Owner
    environment = var.environment
  }
}