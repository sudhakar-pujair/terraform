## Variables declaration
variable "aws_region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_cidr" {
  type = list(string)
}

variable "private_cidr" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "environment" {
  type = string
}

variable "owner" {
  type = string
}

variable "key_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "amis" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "sg_id" {
  type = list(string)
}

variable "service_ports" {
  type = list(number)
}