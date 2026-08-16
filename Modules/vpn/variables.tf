############################################
# Naming
############################################

variable "name_prefix" {
  description = "Prefix used for VPN resource names"
  type        = string
}


############################################
# Transit Gateway
############################################

variable "transit_gateway_id" {
  description = "Transit Gateway ID where VPN connections terminate"
  type        = string
}


############################################
# Primary Customer Gateway
############################################

variable "primary_cgw_public_ip" {
  description = "Public IP address of the primary customer gateway"
  type        = string
}

variable "primary_cgw_bgp_asn" {
  description = "BGP ASN for the primary customer gateway"
  type        = number
  default     = 65001
}


############################################
# Secondary Customer Gateway
############################################

variable "secondary_cgw_public_ip" {
  description = "Public IP address of the secondary customer gateway"
  type        = string
}

variable "secondary_cgw_bgp_asn" {
  description = "BGP ASN for the secondary customer gateway"
  type        = number
  default     = 65002
}


############################################
# Tags
############################################

variable "tags" {
  description = "Common tags applied to VPN resources"
  type        = map(string)
  default     = {}
}