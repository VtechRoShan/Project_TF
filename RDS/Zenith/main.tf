terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../Module/vpc"
}
module "instance" {
  source                = "../Module/instance"
  PublicSub_imroshan_id = module.vpc.PublicSub_imroshan_id

}
module "rds" {
  source                    = "../Module/rds"
  PrivateSub_imroshan_i_id  = module.vpc.PrivateSub_imroshan_i_id
  PrivateSub_imroshan_ii_id = module.vpc.PrivateSub_imroshan_ii_id
}