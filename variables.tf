# VPC Variables
variable "region" { type = string }
variable "vpc_name" { type = string }
variable "vpc_cidr" { type = string }


# Subnet Variables
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "azs" { type = list(string) }

# Aws instance variables
variable "ami" { type = string }
variable "instance_type" { type = string }
variable "key_name" { type = string }
variable "associate_public_ip_address" { type = bool }

# Security Group Variable Values
variable "all_traffic" { type = string }

# S3 Variables
variable "bucket_name" { type = string }

# Common Variables
variable "env" { type = string }

