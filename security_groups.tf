resource "aws_security_group" "test_sg" {
  name        = "${var.vpc_name}-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  tags = {
    Name = "${var.vpc_name}-sg"
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "test_sg_http" {
  security_group_id = aws_security_group.test_sg.id
  cidr_ipv4         = aws_vpc.test_vpc.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "test_sg_https" {
  security_group_id = aws_security_group.test_sg.id
  cidr_ipv4         = aws_vpc.test_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "test_sg_all_traffic" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}