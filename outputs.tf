output "vpc_id" {
  value = aws_vpc.test_vpc.id
}

output "vpc_arn" {
  value = aws_vpc.test_vpc.arn
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "pub_sub_1" {
  value = aws_subnet.pub_sub_1.id
}

output "pub_sub_2" {
  value = aws_subnet.pub_sub_2.id
}

output "public_rt" {
  value = aws_route_table.public_rt.id
}