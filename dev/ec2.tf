module "dev_test_instance" {
  source = "../modules/compute"
  environment     = module.dev_vpc_1.environment
  amis            = var.amis
  aws_region      = var.aws_region
  sg_id           = var.sg_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  project_name    = var.project_name
  public_subnets  = module.dev_vpc_1.public_subnets
  private_subnets = module.dev_vpc_1.private_subnets
  vpc_name        = module.dev_vpc_1.vpc_name
}
