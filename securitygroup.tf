# ---------------------------
# Security Group Definition
# ---------------------------
resource "aws_security_group" "nginx_sg" {
  name        = "${var.vpc_name}-nginx-sg"
  description = "Allow inbound HTTP and all outbound traffic"
  vpc_id      = aws_vpc.dev_vpc.id

  tags = {
    Name        = "${var.vpc_name}-nginx-sg"
    Environment = var.env
  }
}

# ---------------------------
# Ingress Rule (HTTP 80)
# ---------------------------
resource "aws_vpc_security_group_ingress_rule" "nginx_sg_in" {
  security_group_id = aws_security_group.nginx_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}

# ---------------------------
# Egress Rule (Allow all)
# ---------------------------
resource "aws_vpc_security_group_egress_rule" "nginx_sg_out" {
  security_group_id = aws_security_group.nginx_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  to_port     = 0
  ip_protocol = "-1"  # all traffic
}
