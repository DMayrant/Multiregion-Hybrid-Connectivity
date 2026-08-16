output "tgw_id" {
  value = aws_ec2_transit_gateway.disaster_recovery.id
}

output "tgw_arn" {
  value = aws_ec2_transit_gateway.disaster_recovery.arn
}

output "tgw_vpc_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.disaster_recovery.id
}

output "tgw_route_table_id" {
  value = aws_ec2_transit_gateway.disaster_recovery.association_default_route_table_id
}

output "transit_gateway_id" {
  description = "Transit Gateway ID"
  value       = aws_ec2_transit_gateway.disaster_recovery.id
}