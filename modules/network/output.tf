output "vpc_id" {
  value = aws_vpc.dev_vpc.id
}

output "vpc_name" {
  value = lower(local.vpcname)
}

output "environment" {
  value = var.environment
}

output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnets" {
  value = aws_subnet.private_subnets[*].id
}

output "public-rt_id" {
  value = aws_route_table.public_rt.id
}

output "private-rt_id" {
  value = aws_route_table.private_rt.id
}
