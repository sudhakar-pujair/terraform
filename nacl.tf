resource "aws_network_acl" "nacl" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "${var.vpc_name}-nacl"
    Environment = var.env
  }
}

resource "aws_network_acl_rule" "inbound_http" {
  network_acl_id = aws_network_acl.nacl.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.all_traffic
  from_port      = 80
  to_port        = 80
  egress         = false
}

resource "aws_network_acl_rule" "inbound_ssh" {
  network_acl_id = aws_network_acl.nacl.id
  rule_number    = 110
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.all_traffic
  from_port      = 22
  to_port        = 22
  egress         = false
}

resource "aws_network_acl_rule" "outbound_ephemeral" {
  network_acl_id = aws_network_acl.nacl.id
  rule_number    = 200
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.all_traffic
  from_port      = 1024
  to_port        = 65535
  egress         = true
}

resource "aws_network_acl_association" "nacl_association" {
  subnet_id = aws_subnet.public_subnets[0].id
  network_acl_id = aws_network_acl.nacl.id
}