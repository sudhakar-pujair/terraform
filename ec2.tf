resource "aws_instance" "ec2_nginx" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnets.id
  vpc_security_group_ids = aws_security_group.nginx_sg.id
  key_name = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install nginx -y
    systemctl enable nginx
    systemctl start nginx
  EOF

  tags = {
    Name = "${var.vpc_name}-nginx"
    Environment = var.env
  }
}