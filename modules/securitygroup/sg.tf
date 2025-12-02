resource "aws_security_group" "allow_all" {
  name        = "${var.vpc_name}-allow-all"
  description = "Allow inbound ports only"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.service_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Allow ALL outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.vpc_name}-allow-all-sg"
    environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}
