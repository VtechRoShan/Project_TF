terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}
provider "aws" {
  region = var.region
}
module "vpc" {
  source                       = "../Modules/VPC"
  region                       = var.region
  vpc_cidr                     = var.vpc_cidr
  project_name                 = var.project_name
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  app_private_subnet_az1_cidr  = var.app_private_subnet_az1_cidr
  app_private_subnet_az2_cidr  = var.app_private_subnet_az2_cidr
  data_private_subnet_az1_cidr = var.data_private_subnet_az1_cidr
  data_private_subnet_az2_cidr = var.data_private_subnet_az2_cidr

}
module "NAT" {
  source                     = "../Modules/NAT"
  project_name               = var.project_name
  vpc_id                     = module.vpc.vpc_id
  internet_gateway           = module.vpc.internet_gateway
  public_subnet_az1_id       = module.vpc.public_subnet_az1_id
  public_subnet_az2_id       = module.vpc.public_subnet_az2_id
  app_private_subnet_az1_id  = module.vpc.app_private_subnet_az1_id
  app_private_subnet_az2_id  = module.vpc.app_private_subnet_az2_id
  data_private_subnet_az1_id = module.vpc.data_private_subnet_az1_id
  data_private_subnet_az2_id = module.vpc.data_private_subnet_az2_id
}

module "security_group" {
  source       = "../Modules/Security_Group"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "Instance" {
  source = "../Modules/Instance"
  project_name         = var.project_name
  security_group_id    = module.security_group.security_group_id
  public_subnet_az1_id = module.vpc.public_subnet_az1_id
  public_subnet_az2_id = module.vpc.public_subnet_az2_id
}
module "load_balancer" {
  source               = "../Modules/Load_Balancer"
  project_name         = var.project_name
  vpc_id               = module.vpc.vpc_id
  security_group_id    = module.security_group.security_group_id
  public_subnet_az1_id = module.vpc.public_subnet_az1_id
  public_subnet_az2_id = module.vpc.public_subnet_az2_id
  instance_az_i_id     = module.Instance.instance_az_i_id
  instance_az_ii_id    = module.Instance.instance_az_ii_id
}