output "vpc_id" {
    value = aws_vpc.vpc_dev.id
}

output "aws_internet_gateway_id" {
    value = aws_internet_gateway.igw.id
}