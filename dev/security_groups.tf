resource "aws_security_group" "test_sg" {
  name        = "${var.vpc_name}-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  tags = {
    Name = "${var.vpc_name}-sg"
    Environment = var.environment
  }
}