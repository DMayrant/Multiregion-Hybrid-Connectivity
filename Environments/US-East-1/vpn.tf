module "vpn" {
  source = "../../modules/vpn"

  name_prefix = "use1-hybrid"

  # Existing US-East-1 Transit Gateway
  transit_gateway_id = module.tgw.transit_gateway_id

  primary_cgw_public_ip   = var.primary_cgw_public_ip
  secondary_cgw_public_ip = var.secondary_cgw_public_ip

  primary_cgw_bgp_asn   = 65001
  secondary_cgw_bgp_asn = 65002

  tags = {
    Environment = "production"
    Project     = "multi-region-dr"
    ManagedBy   = "terraform"
  }
}