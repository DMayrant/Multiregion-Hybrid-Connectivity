output "alb_logs_bucket_name" {
  value = aws_s3_bucket.alb_logs.bucket
}

output "alb_logs_bucket_arn" {
  value = aws_s3_bucket.alb_logs.arn
}

output "vpc_logs_bucket_name" {
  value = aws_s3_bucket.vpc_logs.bucket
}

output "vpc_logs_bucket_arn" {
  value = aws_s3_bucket.vpc_logs.arn
}