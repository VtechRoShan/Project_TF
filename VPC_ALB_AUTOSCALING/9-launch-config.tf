#Create Launch config

resource "aws_launch_configuration" "instance-launch-config" {
  name_prefix     = "webserver-launch-config"
  image_id        = var.ami
  instance_type   = "t2.micro"
  key_name        = var.keyname
  security_groups = ["${aws_security_group.webserver_sg.id}"]
  #  associate_public_ip_address = true





  lifecycle {
    create_before_destroy = true
  }
  user_data = filebase64("${path.module}/init_webserver.sh")
}
