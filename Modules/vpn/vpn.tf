############################################
# Customer Gateway 1
############################################

resource "aws_customer_gateway" "primary" {
  bgp_asn    = var.primary_cgw_bgp_asn
  ip_address = var.primary_cgw_public_ip
  type       = "ipsec.1"

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-cgw-primary"
  })
}


############################################
# Customer Gateway 2
############################################

resource "aws_customer_gateway" "secondary" {
  bgp_asn    = var.secondary_cgw_bgp_asn
  ip_address = var.secondary_cgw_public_ip
  type       = "ipsec.1"

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-cgw-secondary"
  })
}


############################################
# Primary Site-to-Site VPN
############################################

resource "aws_vpn_connection" "primary" {
  customer_gateway_id = aws_customer_gateway.primary.id
  transit_gateway_id  = var.transit_gateway_id

  type               = "ipsec.1"
  static_routes_only = false # Set to false for BGP 

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-vpn-primary"
  })
}


############################################
# Secondary Site-to-Site VPN
############################################

resource "aws_vpn_connection" "secondary" {
  customer_gateway_id = aws_customer_gateway.secondary.id
  transit_gateway_id  = var.transit_gateway_id

  type               = "ipsec.1"
  static_routes_only = false # Set to false for BGP 

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-vpn-secondary"
  })
}