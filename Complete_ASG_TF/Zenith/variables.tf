variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "99.0.0.0/16"
}

variable "project_name" {
  default = "ugra-alb"
}

variable "public_subnet_az1_cidr" {
  default = "99.0.1.0/24"
}

variable "public_subnet_az2_cidr" {
  default = "99.0.2.0/24"
}

variable "app_private_subnet_az1_cidr" {
  default = "99.0.3.0/24"
}

variable "app_private_subnet_az2_cidr" {
  default = "99.0.4.0/24"
}

variable "data_private_subnet_az1_cidr" {
  default = "99.0.5.0/24"
}

variable "data_private_subnet_az2_cidr" {
  default = "99.0.6.0/24"
}
