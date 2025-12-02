locals {
  DeployedBy = upper("Terraform")
  Owner = lower("Dev-Terraform")
  public_cidr = distinct(var.public_cidr)
  private_cidr = distinct(var.private_cidr)
  vpcname = join("-", [var.vpc_name, var.environment])
}