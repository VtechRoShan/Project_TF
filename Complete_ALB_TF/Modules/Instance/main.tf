# create EC2 instances in both subnets
resource "aws_instance" "instance_az_i" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  key_name = "imroshan_authkey_vrg"
  subnet_id     = var.public_subnet_az1_id
  vpc_security_group_ids = [var.security_group_id]
  
  associate_public_ip_address = "true"

    metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  tags   = {
    Name    = "${var.project_name}-Instance_az1"
  }
}

resource "aws_instance" "instance_az_ii" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  key_name = "imroshan_authkey_vrg"
  subnet_id     = var.public_subnet_az2_id
  vpc_security_group_ids = [var.security_group_id]
  
  associate_public_ip_address = "true"

    metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  tags   = {
    Name    = "${var.project_name}-Instance_az2"
  }
}