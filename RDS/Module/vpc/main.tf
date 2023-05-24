resource "aws_vpc" "VPC_imroshan" {
  cidr_block = "99.0.0.0/16"
  tags = {
    "Name" = "8586-VPC"
  }
}
resource "aws_subnet" "PublicSub_imroshan" {
  vpc_id            = aws_vpc.VPC_imroshan.id
  cidr_block        = "99.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    "Name"      = "Public_Subnet"
    "Purpose"   = "Exprimental"
    "CreatedBy" = "Roshan Poudel"
  }
}
resource "aws_subnet" "PrivateSub_imroshan_i" {
  vpc_id            = aws_vpc.VPC_imroshan.id
  cidr_block        = "99.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    "Name"      = "Private_Subnet"
    "Purpose"   = "Exprimental"
    "CreatedBy" = "Roshan Poudel"
  }
}
resource "aws_subnet" "PrivateSub_imroshan_ii" {
  vpc_id            = aws_vpc.VPC_imroshan.id
  cidr_block        = "99.0.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    "Name"      = "Private_Subnet"
    "Purpose"   = "Exprimental"
    "CreatedBy" = "Roshan Poudel"
  }
}
resource "aws_internet_gateway" "igw_imroshan" {
  vpc_id = aws_vpc.VPC_imroshan.id
}
resource "aws_route_table" "RT_public_imroshan" {
  vpc_id = aws_vpc.VPC_imroshan.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_imroshan.id
  }
}
resource "aws_route_table" "RT_private_imroshan" {
  vpc_id = aws_vpc.VPC_imroshan.id
}
resource "aws_route_table_association" "PublicRT_Association" {
  subnet_id      = aws_subnet.PublicSub_imroshan.id
  route_table_id = aws_route_table.RT_public_imroshan.id
}