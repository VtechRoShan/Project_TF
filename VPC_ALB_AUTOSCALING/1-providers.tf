# Configure Providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# # Create remote state
terraform {
  backend "s3" {
    bucket = "8586-terraform-state"
    region = "us-east-1"
    key    = "terraform.tfstate"
  }
}
