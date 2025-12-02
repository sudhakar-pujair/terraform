output "vpc_id" {
  value = aws_vpc.dev_vpc.id
}

output "vpc_name" {
  value = lower(local.vpcname)
}

output "environment" {
  value = var.environment
}

output "public_sub_id" {
  value = "${aws_subnet.public_sub.*.id}"
}

output "private_sub_id" {
  value = "${aws_subnet.private_sub.*.id}"
}

output "public-rt-route-table-id" {
  value = "${aws_route_table.public-rt.id}"
}

output "private-rt-route-table-id" {
  value = "${aws_route_table.private-rt.id}"
}