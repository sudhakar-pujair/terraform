resource "aws_subnet" "private_subnets" {
  count = length(local.private_cidr)
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = element(local.private_cidr, count.index)
  availability_zone = element(distinct(var.azs), count.index)

  tags = {
    Name = "${local.vpcname}-private-subnet-${count.index + 1}"
    DeployedBy = local.DeployedBy
    Owner = local.Owner
    environment = var.environment
  }
}