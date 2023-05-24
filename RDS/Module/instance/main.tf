resource "aws_instance" "imroshan_tf_404" {
  count         = 1
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  # vpc_id                      = aws_vpc.VPC_imroshan.id
  subnet_id                   = var.PublicSub_imroshan_id
  key_name                    = "imroshan_authkey_vrg"
  associate_public_ip_address = "true"
  # vpc_security_group_ids      = [data.aws_security_group.launch-wizard-imRoshan.id]
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }
  user_data = "#!/bin/bash\n\nsudo apt-get update\nsudo apt-get install -y apache2\n echo <html><h1>welcome to $(hostname -f )</h1></html> "
  tags = {
    "Name"    = "imroshan_tf_${count.index}"
    "Purpose" = "Exprimental"
  }
}