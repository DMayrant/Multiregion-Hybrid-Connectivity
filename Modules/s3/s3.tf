############################################
# Current AWS Account
############################################

data "aws_caller_identity" "current" {}

############################################
# VPC Flow Logs Bucket
############################################

resource "aws_s3_bucket" "vpc_logs" {
  bucket = "${var.env}-vpc-flow-logs-${data.aws_caller_identity.current.account_id}"
  force_destroy = true

  tags = {
    Name        = "${var.env}-vpc-flow-logs"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "vpc_logs" {
  bucket = aws_s3_bucket.vpc_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "vpc_logs" {
  bucket = aws_s3_bucket.vpc_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "vpc_logs" {
  bucket = aws_s3_bucket.vpc_logs.id

  rule {
    id     = "expire-old-flow-logs"
    status = "Enabled"

    expiration {
      days = 90
    }
  }
}

############################################
# ALB Access Logs Bucket
############################################

resource "aws_s3_bucket" "alb_logs" {
  bucket = "${var.env}-alb-logs-${data.aws_caller_identity.current.account_id}"
  force_destroy = true

  tags = {
    Name        = "${var.env}-alb-logs"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "alb_logs" {
  bucket = aws_s3_bucket.alb_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "alb_logs" {
  bucket = aws_s3_bucket.alb_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "alb_logs" {
  bucket = aws_s3_bucket.alb_logs.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "alb_logs" {
  bucket = aws_s3_bucket.alb_logs.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

############################################
# Session Manager Logs Bucket
############################################

resource "aws_s3_bucket" "session_logs" {
  bucket = "${var.env}-session-manager-logs-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "${var.env}-session-manager-logs"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "session_logs" {
  bucket = aws_s3_bucket.session_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "session_logs" {
  bucket = aws_s3_bucket.session_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

############################################
# Suricata Logs Bucket (Optional)
############################################

resource "aws_s3_bucket" "suricata_logs" {
  count = var.create_suricata_bucket ? 1 : 0

  bucket = "${var.env}-suricata-logs-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "${var.env}-suricata-logs"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "suricata_logs" {
  count = var.create_suricata_bucket ? 1 : 0

  bucket = aws_s3_bucket.suricata_logs[0].id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "suricata_logs" {
  count = var.create_suricata_bucket ? 1 : 0

  bucket = aws_s3_bucket.suricata_logs[0].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

############################################
# ALB Access Logs Bucket Policy
############################################

resource "aws_s3_bucket_policy" "alb_logs_policy" {
  bucket = aws_s3_bucket.alb_logs.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "AllowALBAccessLogDeliveryAclCheck"
        Effect = "Allow"

        Principal = {
          Service = "logdelivery.elasticloadbalancing.amazonaws.com"
        }

        Action = "s3:GetBucketAcl"

        Resource = aws_s3_bucket.alb_logs.arn
      },
      {
        Sid    = "AllowALBAccessLogDeliveryWrite"
        Effect = "Allow"

        Principal = {
          Service = "logdelivery.elasticloadbalancing.amazonaws.com"
        }

        Action = "s3:PutObject"

        Resource = "${aws_s3_bucket.alb_logs.arn}/alb/AWSLogs/${data.aws_caller_identity.current.account_id}/*"

        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}