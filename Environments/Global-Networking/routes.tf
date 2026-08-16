############################################
# EU-West-2 VPC Route to US-East-1
############################################

resource "aws_route" "euw2_private_to_use1" {
  provider = aws.euw2

  route_table_id         = data.terraform_remote_state.euw2.outputs.private_route_table_id
  destination_cidr_block = data.terraform_remote_state.use1.outputs.vpc_cidr_block
  transit_gateway_id     = data.terraform_remote_state.euw2.outputs.tgw_id
}

############################################
# US-East-1 VPC Return Route to EU-West-2
############################################

resource "aws_route" "use1_private_to_euw2" {
  provider = aws.use1

  route_table_id         = data.terraform_remote_state.use1.outputs.private_route_table_id
  destination_cidr_block = data.terraform_remote_state.euw2.outputs.vpc_cidr_block
  transit_gateway_id     = data.terraform_remote_state.use1.outputs.tgw_id
}

############################################
# TGW Routes: EU-West-2 <-> US-East-1
############################################

############################################
# TGW Routes: EU-West-2 <-> US-East-1
############################################

resource "aws_ec2_transit_gateway_route" "euw2_to_use1" {
  provider = aws.euw2

  destination_cidr_block         = data.terraform_remote_state.use1.outputs.vpc_cidr_block
  transit_gateway_route_table_id = data.terraform_remote_state.euw2.outputs.tgw_route_table_id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.euw2_to_use1.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment_accepter.use1_accept_euw2
  ]
}

resource "aws_ec2_transit_gateway_route" "use1_to_euw2" {
  provider = aws.use1

  destination_cidr_block         = data.terraform_remote_state.euw2.outputs.vpc_cidr_block
  transit_gateway_route_table_id = data.terraform_remote_state.use1.outputs.tgw_route_table_id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.euw2_to_use1.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment_accepter.use1_accept_euw2
  ]
}