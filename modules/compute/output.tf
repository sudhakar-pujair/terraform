output "public-servers" {
  value = "${aws_instance.public-server.*.id}"
}

output "public-servers-public-ip" {
  value = "${aws_instance.public-server.*.public_ip}"
}

output "public-servers-private-ip" {
  value = "${aws_instance.public-server.*.private_ip}"
}