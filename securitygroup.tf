resource "aws_security_group" "nginx_sg" {
  name        = "${var.vpc_name}-nginx-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_id.id

  tags = {
    Name = "${var.vpc_name}-nginx-sg"
    Environment = var.env
  }
}

resource "aws_vpc_security_group_ingress_rule" "nginx_sg_in" {
  security_group_id = aws_security_group.nginx_sg.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "nginx_sg_out" {
  security_group_id = aws_security_group.nginx_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}