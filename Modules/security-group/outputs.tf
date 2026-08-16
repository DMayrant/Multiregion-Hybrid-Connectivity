############################################
# EKS
############################################

output "eks_cluster_sg_id" {
  value = aws_security_group.eks_cluster_sg.id
}

output "eks_nodes_sg_id" {
  value = aws_security_group.eks_nodes_sg.id
}

############################################
# Aurora
############################################

output "aurora_sg_id" {
  value = aws_security_group.aurora_sg.id
}

############################################
# Application Load Balancer
############################################

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

############################################
# Web Servers (Auto Scaling Group)
############################################

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}

############################################
# SSM Endpoints
############################################

output "ssm_endpoints_sg_id" {
  value = aws_security_group.ssm_endpoints_sg.id
}

############################################
# Suricata
############################################

output "suricata_sg_id" {
  value = aws_security_group.suricata_sg.id
}