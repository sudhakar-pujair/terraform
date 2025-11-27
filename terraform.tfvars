# VPC Variables Values
region               = "us-east-1"
vpc_name             = "dev-vpc"
vpc_cidr             = "10.1.0.0/16"
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.3.0/24", "10.1.4.0/24"]
azs                  = ["us-east-1a", "us-east-1b"]
env                  = "dev"

# EC2 Varibale Values
ami                         = "ami-0ecb62995f68bb549"
instance_type               = "t3.micro"
key_name                    = "devops"
associate_public_ip_address = "true"

# S3 Varibale Values
bucket_name = "DevBucket"