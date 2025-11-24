output "terraform_vpc_id" {
    value = aws_vpc.terraform_vpc.id
}

output "terraform_vpc_arn" {
    value = aws_vpc.terraform_vpc.arn
}

output "terraform_igw" {
    value = aws_internet_gateway.igw.id
}

output "public_sub_1" {
    value = aws_subnet.public_subnet_1.id
}

output "public_sub_2" {
    value = aws_subnet.public_subnet_2.id
}

output "public_sub_3" {
    value = aws_subnet.public_subnet_3.id
}