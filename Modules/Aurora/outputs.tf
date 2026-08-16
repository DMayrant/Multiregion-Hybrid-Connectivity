############################################
# Aurora Cluster
############################################

output "cluster_id" {
  description = "Aurora Cluster ID"
  value       = aws_rds_cluster.aurora_cluster.id
}

output "cluster_arn" {
  description = "Aurora Cluster ARN"
  value       = aws_rds_cluster.aurora_cluster.arn
}

output "cluster_endpoint" {
  description = "Aurora Writer Endpoint"
  value       = aws_rds_cluster.aurora_cluster.endpoint
}

output "reader_endpoint" {
  description = "Aurora Reader Endpoint"
  value       = aws_rds_cluster.aurora_cluster.reader_endpoint
}

############################################
# Writer Instance
############################################

output "writer_instance_id" {
  description = "Aurora Writer Instance ID"
  value       = aws_rds_cluster_instance.aurora_writer.id
}

output "writer_instance_arn" {
  description = "Aurora Writer Instance ARN"
  value       = aws_rds_cluster_instance.aurora_writer.arn
}

############################################
# Reader Instance
############################################

output "reader_instance_id" {
  description = "Aurora Reader Instance ID"
  value       = aws_rds_cluster_instance.aurora_reader.id
}

output "reader_instance_arn" {
  description = "Aurora Reader Instance ARN"
  value       = aws_rds_cluster_instance.aurora_reader.arn
}

############################################
# Database Subnet Group
############################################

output "db_subnet_group_name" {
  description = "Aurora DB Subnet Group"
  value       = aws_db_subnet_group.aurora_subnet_group.name
}