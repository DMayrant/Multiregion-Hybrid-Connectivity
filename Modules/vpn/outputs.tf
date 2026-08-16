############################################
# Customer Gateway Outputs
############################################

output "primary_customer_gateway_id" {
  description = "ID of the primary customer gateway"
  value       = aws_customer_gateway.primary.id
}

output "secondary_customer_gateway_id" {
  description = "ID of the secondary customer gateway"
  value       = aws_customer_gateway.secondary.id
}


############################################
# VPN Connection Outputs
############################################

output "primary_vpn_connection_id" {
  description = "ID of the primary Site-to-Site VPN connection"
  value       = aws_vpn_connection.primary.id
}

output "secondary_vpn_connection_id" {
  description = "ID of the secondary Site-to-Site VPN connection"
  value       = aws_vpn_connection.secondary.id
}


############################################
# VPN Tunnel Public IPs
############################################

output "primary_vpn_tunnel1_address" {
  description = "AWS public IP address for primary VPN tunnel 1"
  value       = aws_vpn_connection.primary.tunnel1_address
}

output "primary_vpn_tunnel2_address" {
  description = "AWS public IP address for primary VPN tunnel 2"
  value       = aws_vpn_connection.primary.tunnel2_address
}

output "secondary_vpn_tunnel1_address" {
  description = "AWS public IP address for secondary VPN tunnel 1"
  value       = aws_vpn_connection.secondary.tunnel1_address
}

output "secondary_vpn_tunnel2_address" {
  description = "AWS public IP address for secondary VPN tunnel 2"
  value       = aws_vpn_connection.secondary.tunnel2_address
}