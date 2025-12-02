environment   = "dev"
aws_region    = "us-east-1"

vpc_cidr      = "10.1.0.0/16"
vpc_name      = "dev_vpc"
key_name      = "devops"

azs           = ["us-east-1a", "us-east-1b"]
public_cidr   = ["10.1.1.0/24", "10.1.2.0/24"]
private_cidr  = ["10.1.3.0/24", "10.1.4.0/24"]

project_name  = "test"
amis          = "ami-0ecb62995f68bb549"
instance_type = "t3.micro"

owner         = "test-terraform"
service_ports = ["80", "443", "22", "3389", "3306"]