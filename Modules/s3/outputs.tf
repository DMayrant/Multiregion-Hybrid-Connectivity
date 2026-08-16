############################################
# Outputs
############################################

output "vpc_logs_bucket_id" {
  value = aws_s3_bucket.vpc_logs.id
}

output "vpc_logs_bucket_arn" {
  value = aws_s3_bucket.vpc_logs.arn
}

output "alb_logs_bucket_id" {
  value = aws_s3_bucket.alb_logs.id
}

output "alb_logs_bucket_arn" {
  value = aws_s3_bucket.alb_logs.arn
}

output "session_logs_bucket_id" {
  value = aws_s3_bucket.session_logs.id
}

output "session_logs_bucket_arn" {
  value = aws_s3_bucket.session_logs.arn
}

output "suricata_logs_bucket_id" {
  value = var.create_suricata_bucket ? aws_s3_bucket.suricata_logs[0].id : null
}

output "suricata_logs_bucket_arn" {
  value = var.create_suricata_bucket ? aws_s3_bucket.suricata_logs[0].arn : null
}

output "session_logs_bucket_name" {
  value = aws_s3_bucket.session_logs.bucket
}

output "alb_logs_bucket_name" {
  value = aws_s3_bucket.alb_logs.bucket
}