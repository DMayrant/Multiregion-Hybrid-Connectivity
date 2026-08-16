resource "aws_rds_cluster" "aurora_cluster" {

  cluster_identifier = "aurora-cluster-${var.env}"

  engine      = var.engine
  engine_mode = "provisioned"

  master_username = var.db_username
  master_password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.aurora_subnet_group.name

  vpc_security_group_ids = [
    var.aurora_security_group_id
  ]

storage_encrypted       = var.storage_encrypted
deletion_protection     = var.deletion_protection
skip_final_snapshot     = var.skip_final_snapshot
backup_retention_period = var.backup_retention_period
apply_immediately       = var.apply_immediately

tags = {
    Name = "aurora-cluster-${var.env}"
    Environment = var.env
  }
}


# Writer Instance 
resource "aws_rds_cluster_instance" "aurora_writer" {

  identifier         = "aurora-writer-${var.env}"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id

  instance_class      = var.instance_class
  engine              = aws_rds_cluster.aurora_cluster.engine
  publicly_accessible = false

  db_subnet_group_name = aws_db_subnet_group.aurora_subnet_group.name

  tags = {
    Name = "Aurora-Writer"
    Environment = var.env
  }
}

# Reader Instance
resource "aws_rds_cluster_instance" "aurora_reader" {

  identifier         = "aurora-reader-${var.env}"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id

  instance_class      = var.instance_class
  engine              = aws_rds_cluster.aurora_cluster.engine
  publicly_accessible = false

  db_subnet_group_name = aws_db_subnet_group.aurora_subnet_group.name

  tags = {
    Name = "Aurora-Reader"
    Environment = var.env
  }
}



