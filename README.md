Multi-Region Hybrid Connectivity ☁️

Maintaining highly available cloud resources such as servers, databases, containerized workloads, storage, and networks is a key reason for implementing multi-region architectures, especially for disaster recovery.

This project demonstrates a multi-region hybrid AWS architecture built with Terraform modules. AWS Transit Gateway (TGW) provides centralized connectivity between regional environments, while inter-region TGW peering enables workloads and shared services to communicate across AWS Regions. Amazon Route 53 failover routing provides DNS-level resiliency by directing traffic toward healthy application endpoints when the primary endpoint becomes unavailable.

For hybrid connectivity, parallel AWS Site-to-Site VPN connections were provisioned to demonstrate redundant connectivity between AWS and a simulated corporate data center. The VPN architecture uses separate Customer Gateways (CGWs), dynamic routing with BGP, and Equal-Cost Multipath (ECMP) support on Transit Gateway to provide multiple eligible network paths.

Security controls were incorporated throughout the architecture, including AWS WAF for protecting application ingress and a Suricata IDS/IPS deployment in US-East-2 for network traffic inspection and threat detection.

The overall environment is designed to demonstrate high availability, network resiliency, disaster recovery, secure hybrid connectivity, and Infrastructure as Code (IaC) across multiple AWS Regions.

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
![image alt](https://github.com/DMayrant/Multiregion-Hybrid-Connectivity/blob/main/Screenshot%202569-08-16%20at%2019.20.37.png?raw=true)

# Disaster Recovery Architecture ☁️

![image alt](https://github.com/DMayrant/Multiregion-Hybrid-Connectivity/blob/main/Multi-Region-Hybrid.jpeg?raw=true)


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


