# VPC Details
variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(any)
}

variable "private_subnet_cidrs" {
  type = list(any)
}

variable "azs" {
  type = list(any)
}

variable "env" {
  type = string
}

# Aws instance variables
variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}

variable "associate_public_ip_address" {
  type = string
}
