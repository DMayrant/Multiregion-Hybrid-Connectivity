############################################
# Transit Gateway
############################################

output "tgw_id" {
  value = module.tgw.tgw_id
}

output "tgw_arn" {
  value = module.tgw.tgw_arn
}

output "tgw_vpc_attachment_id" {
  value = module.tgw.tgw_vpc_attachment_id
}

output "tgw_route_table_id" {
  value = module.tgw.tgw_route_table_id
}

##########
# VPC 
#########

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "private_route_table_id" {
  value = module.vpc.private_route_table_id
}

output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}

##############################################
# Security Group to allow ingress to US-East-1
##############################################

output "web_sg_id" {
  value = module.security_groups.web_sg_id
}