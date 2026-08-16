############################################
# EU-West-2 -> US-East-1 Peering
############################################

resource "aws_ec2_transit_gateway_peering_attachment" "euw2_to_use1" {
  provider = aws.euw2

  transit_gateway_id      = data.terraform_remote_state.euw2.outputs.tgw_id
  peer_transit_gateway_id = data.terraform_remote_state.use1.outputs.tgw_id

  peer_account_id = "739786453678"
  peer_region     = "us-east-1"

  tags = {
    Name = "euw2-to-use1-peering"
  }
}

############################################
# Accept EU-West-2 Peering
############################################

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "use1_accept_euw2" {
  provider = aws.use1

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.euw2_to_use1.id

  tags = {
    Name        = "accept-euw2-peering"
    Environment = "global-networking"
    ManagedBy   = "Terraform"
  }
}