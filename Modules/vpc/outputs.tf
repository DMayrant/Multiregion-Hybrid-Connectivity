############################################
# VPC
############################################

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main_vpc.id
}

output "vpc_arn" {
  description = "VPC ARN"
  value       = aws_vpc.main_vpc.arn
}

output "vpc_cidr_block" {
  description = "VPC CIDR block"
  value       = aws_vpc.main_vpc.cidr_block
}

############################################
# Public Subnets
############################################

output "public_subnets" {
  description = "Public subnet IDs"
  value       = aws_subnet.public_subnet[*].id
}

output "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  value       = aws_subnet.public_subnet[*].cidr_block
}

############################################
# Private Subnets
############################################

output "private_subnets" {
  description = "Private subnet IDs"
  value       = aws_subnet.private_subnet[*].id
}

output "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  value       = aws_subnet.private_subnet[*].cidr_block
}

############################################
# Internet Gateway
############################################

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

############################################
# NAT Gateway
############################################

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.nat.id
}

output "nat_gateway_public_ip" {
  description = "Elastic IP of the NAT Gateway"
  value       = aws_eip.nat.public_ip
}

############################################
# Route Tables
############################################

output "public_route_table_id" {
  description = "Public Route Table ID"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "Private Route Table ID"
  value       = aws_route_table.private.id
}