# VPC Variables
variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

# Subnet Variables
variable "public_subnet_cidrs" {
  type = list(any)
}

variable "private_subnet_cidrs" {
  type = list(any)
}

variable "azs" {
  type = list(any)
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
  type = bool
}

# S3 Variables
variable "bucket_name" {
  type = string

  # validation {
  #   condition     = var.bucket_name == lower(var.bucket_name)
  #   error_message = "bucket_name must be all lowercase."
  # }
}

# Common Variables
variable "env" {
  type = string
}

