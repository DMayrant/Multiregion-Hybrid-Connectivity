data "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-profile-${var.env}"
}