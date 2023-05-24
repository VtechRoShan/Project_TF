resource "aws_launch_template" "Instance" {
  name_prefix = "${var.project_name}-ASG-Instance"
  image_id = "ami-007855ac798b5175e"
  instance_type = "t2.micro" 
  security_groups = var.security_group_id 
}

data "aws_availability_zones" "available_zones" {}

resource "aws_autoscaling_group" "" {
  availability_zones = [data.aws_availability_zones.available_zones.names[0], data.aws_availability_zones.available_zones.names[1]]
  desired_capacity = 1
  max_size = 3
  min_size = 1
  launch_template {
    id = aws_launch_template.Instance.id
    version = "$latest"
  }
}