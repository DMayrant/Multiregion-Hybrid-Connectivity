# Multi-Region Hybrid Connection ☁️ 
Maintaining cloud resources such as servers, databases, workloads, storage and networks are the purpose for Multi-region deployments, especially for disaster recovery. A transit gateway (TGW) is used to keep regions running hot by connecting cloud environments to share services in the event of a disaster. Route 53 failover policy will help route traffic to healthy regions 

Parallel AWS Managed VPN's were configured for failover and redundancy to connect to the on-premise environment and connected to equipment behind two CGW's on-prem. The VPNs were connected to TGW with Equal-Cost Multipath (ECMP) enabled.

This project demonstrates a multi-region disaster recovery architecture built on AWS using Terraform modules. The environment is designed to improve availability, resiliency, and disaster recovery by deploying infrastructure across multiple AWS Regions.

# Commands 🏗️
```bash
terraform state list
terraform init 
terraform init -reconfigure
terraform fmt -recursive 
terraform validate 
terraform plan
terraform apply 
```

Verify TGW attachments 🔌 🇺🇸 🇬🇧
# US-East-1 🇺🇸
```bash 
aws ec2 describe-transit-gateway-peering-attachments \
    --region us-east-1

aws ec2 describe-transit-gateway-route-tables \
    --region us-east-1     
```

 # EU-West-2 🇬🇧
 ```bash
 aws ec2 describe-transit-gateway-peering-attachments \
    --region eu-west-2

 aws ec2 describe-transit-gateway-route-tables \
    --region eu-west-2
      
```  

# Database connection validation
```bash
# Test TCP connectivity to the Aurora PostgreSQL endpoint (port 5432)
nc -zv <aurora-endpoint> 5432

# Resolve the Aurora endpoint to an IP address
nslookup <aurora-endpoint>

# Display detailed DNS records for the Aurora endpoint
dig <aurora-endpoint>

# Trace the network path to the Aurora endpoint
traceroute <aurora-endpoint>
```

# Disaster Recovery Architecture ☁️


# Services ☁️
- Multi-region AWS deployment
- Route 53 (failover routing)
- AWS site-to-site VPN
- AWS Transit Gateway connectivity
- Amazon EKS cluster
- Application Load Balancer (ALB)
- Amazon Aurora database
- AWS WAF
- GuardDuty
- VPC Endpoints
- AWS Systems Manager Session Manager
- CloudWatch logging
- Amazon S3
- Security Groups
- Auto Scaling
- Suricata IDS for network inspection
- Environment-specific Terraform configurations


