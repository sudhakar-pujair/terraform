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

variable "pub_sub_1_cidr" {
  type = string
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
