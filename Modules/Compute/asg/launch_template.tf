############################################
# Launch Template
############################################

resource "aws_launch_template" "ec2_launch_template" {
  name_prefix = "ec2-launch-template-${var.env}-"

  image_id      = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.instance_profile_name
  }

  network_interfaces {
    associate_public_ip_address = false

    security_groups = [
      var.instance_security_group_id
    ]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "webserver-${var.env}"
      Environment = var.env
    }
  }

  tags = {
    Name        = "launch-template-${var.env}"
    Environment = var.env
  }
}