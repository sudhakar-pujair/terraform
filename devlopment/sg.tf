module "dev_test_sg" {
  source = "../modules/securitygroup"
  vpc_name = module.dev_vpc_1.vpc_name
  vpc_id = module.dev_vpc_1.vpc_id
  environment = module.dev_vpc_1.environment
  service_ports = var.service_ports
}