variable "vpc_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "service_ports" {
  type = list(number)
}

variable "vpc_id" {
  type = string
}
