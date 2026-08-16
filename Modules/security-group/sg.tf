
############################################
# Web Servers (Auto Scaling Group)
############################################

resource "aws_security_group" "web_sg" {
  name        = "web-sg-${var.env}"
  description = "Security group for Auto Scaling Group web servers"
  vpc_id      = var.vpc_id

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "web-sg-${var.env}"
    Environment = var.env
  }
}

############################################
# EKS Control Plane Security Group
############################################

resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-cluster-sg-${var.env}"
  description = "Security group for EKS control plane"
  vpc_id      = var.vpc_id

  tags = {
    Name = "eks-cluster-sg-${var.env}"
  }
}

resource "aws_security_group_rule" "cluster_ingress_nodes" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster_sg.id
  source_security_group_id = aws_security_group.eks_nodes_sg.id
  description              = "Worker nodes to EKS API server"
}

resource "aws_security_group_rule" "cluster_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks_cluster_sg.id
}

############################################
# EKS Worker Nodes Security Group
############################################

resource "aws_security_group" "eks_nodes_sg" {
  name        = "eks-nodes-sg-${var.env}"
  description = "Security group for EKS worker nodes"
  vpc_id      = var.vpc_id

  tags = {
    Name = "eks-nodes-sg-${var.env}"
  }
}

resource "aws_security_group_rule" "nodes_ingress_self" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  self              = true
  security_group_id = aws_security_group.eks_nodes_sg.id
  description       = "Allow node-to-node communication"
}

resource "aws_security_group_rule" "nodes_ingress_cluster" {
  type                     = "ingress"
  from_port                = 1025
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_nodes_sg.id
  source_security_group_id = aws_security_group.eks_cluster_sg.id
  description              = "Control plane to worker nodes"
}

resource "aws_security_group_rule" "nodes_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks_nodes_sg.id
}

############################################
# Aurora PostgreSQL
############################################

resource "aws_security_group" "aurora_sg" {
  name        = "postgres-db-sg-${var.env}"
  description = "Aurora PostgreSQL Security Group"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Postgres from EKS Worker Nodes"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.eks_nodes_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "postgres-db-sg-${var.env}"
  }
}

############################################
# Session Manager VPC Endpoints
############################################

resource "aws_security_group" "ssm_endpoints_sg" {
  name        = "ssm-endpoints-sg-${var.env}"
  description = "Security group for SSM Interface Endpoints"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssm-endpoints-sg-${var.env}"
  }
}

############################################
# Application Load Balancer
############################################

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg-${var.env}"
  description = "Application Load Balancer"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP inside VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg-${var.env}"
  }
}

############################################
# Suricata IDS
############################################

resource "aws_security_group" "suricata_sg" {
  name        = "suricata-sg-${var.env}"
  description = "Security group for Suricata IDS"
  vpc_id      = var.vpc_id

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "suricata-sg-${var.env}"
  }
}

#########################################################
# Allowing ingress from US-East-2 and EU-West-2 to Aurora
#########################################################

resource "aws_security_group_rule" "aurora_from_euw2_web" {
  type      = "ingress"
  from_port = 5432
  to_port   = 5432
  protocol  = "tcp"

  security_group_id = aws_security_group.aurora_sg.id
  cidr_blocks       = ["10.123.0.0/16"]

  description = "Allow EU-West-2 VPC to access Aurora PostgreSQL"
}