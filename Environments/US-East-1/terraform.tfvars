############################################
# General
############################################

aws_region = "us-east-1"
env        = "prod"


############################################
# Aurora / Database
############################################

apply_immediately       = true
backup_retention_period = 7
deletion_protection     = false
engine                  = "aurora-postgresql"
instance_class          = "db.r6g.large"
skip_final_snapshot     = true
storage_encrypted       = true


############################################
# EKS
############################################

public_access_cidrs = [
  "0.0.0.0/0"
]

name_prefix = "use1-hybrid"

primary_cgw_public_ip   = "198.51.100.10"
secondary_cgw_public_ip = "203.0.113.20"

primary_cgw_bgp_asn   = 65001
secondary_cgw_bgp_asn = 65002
