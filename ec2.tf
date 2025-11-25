resource "aws_instance" "test_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.pub_sub_1.id
  key_name = var.key_name
  associate_public_ip_address = var.associate_public_ip_address

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
    echo "Deployed using Terraform user_data file!" > /usr/share/nginx/html/index.html
    EOF

  tags = {
    Name = "${var.vpc_name}-ec2"
    Environment = var.environment
  }
}