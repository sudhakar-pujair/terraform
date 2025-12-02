variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_cidr" {type = list(string)}
variable "private_cidr" {type = list(string)}
variable "azs" {type = list(string)}
variable "environment" {}
variable "owner" {}