resource "aws_ec2_transit_gateway" "disaster_recovery" {
  description = "${var.env}-${var.region}-tgw"

  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  auto_accept_shared_attachments  = "enable"

  vpn_ecmp_support = "enable"

  tags = {
    Name        = "${var.env}-${var.region}-tgw"
    Environment = var.env
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "disaster_recovery" {
  transit_gateway_id = aws_ec2_transit_gateway.disaster_recovery.id
  vpc_id             = var.vpc_id
  subnet_ids         = var.private_subnet_ids

  tags = {
    Name = "${var.env}-${var.region}-tgw-vpc-attachment"
  }
}