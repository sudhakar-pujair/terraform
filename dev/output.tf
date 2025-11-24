output "vpc_id" {
    value = aws_vpc.vpc_dev.id
}

output "aws_internet_gateway_id" {
    value = aws_internet_gateway.igw.id
}

output "public_subnet_1" {
    value = aws_subnet.public_subnet_1.id  
}

output "public_subnet_2" {
    value = aws_subnet.public_subnet_2.id  
}