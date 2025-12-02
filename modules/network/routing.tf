resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = var.vpc_cidr
    gateway_id = aws_internet_gateway.dev_igw.id
  }

  tags = {
    Name = "${local.vpcname}-public-RT"
    environment = var.environment
    DeployedBy = local.DeployedBy
    Owner = local.Owner
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "${local.vpcname}-private-RT"
    environment = var.environment
    DeployedBy = local.DeployedBy
    Owner = local.Owner
  }
}

resource "aws_route_table_association" "public-sub-associate" {
  count = length(local.public_cidr)
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private-sub-associate" {
  count = length(local.private_cidr)
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}