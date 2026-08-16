resource "aws_autoscaling_group" "ec2_asg" {
  name_prefix = "webserver-${var.env}-"

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = [
    var.target_group_arn
  ]

 launch_template {
  id      = aws_launch_template.ec2_launch_template.id
  version = aws_launch_template.ec2_launch_template.latest_version
}

  health_check_type         = "ELB"
  health_check_grace_period = var.health_check_grace_period

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "webserver-${var.env}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.env
    propagate_at_launch = true
  }
}