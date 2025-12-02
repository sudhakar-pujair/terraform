module "dev_vpc_1" {
  source = "../modules/network"

  vpc_cidr     = var.vpc_cidr
  vpc_name     = var.vpc_name
  environment  = var.environment

  public_cidr  = var.public_cidr
  private_cidr = var.private_cidr
  azs          = var.azs

  owner        = var.owner
}
