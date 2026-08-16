resource "aws_cloudwatch_log_group" "ssm_sessions" {
  name              = "/aws/ssm/sessions"
  retention_in_days = 30

  tags = {
    Name        = "${var.env}-ssm-sessions"
    Environment = var.env
  }
}

resource "aws_ssm_document" "session_manager_settings" {
  name          = "SSM-custom-session-manager-${var.env}"
  document_type = "Session"

  content = jsonencode({
    schemaVersion = "1.0"
    description   = "Session Manager settings"

    sessionType = "Standard_Stream"

    inputs = {
      s3BucketName                = var.s3_bucket_name
      s3KeyPrefix                 = "session-logs/"
      cloudWatchEncryptionEnabled = false
      cloudWatchLogGroupName      = aws_cloudwatch_log_group.ssm_sessions.name
    }
  })
}


# Generated credentials that will be stored in SSM

resource "random_password" "db_password" {
  length  = 20
  special = true
  override_special = "!#$%^&*()-_=+[]{}:?"
}

resource "aws_ssm_parameter" "db_username" {
  name  = "/${var.env}/database/username"
  type  = "String"
  value = "dbadmin"
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/${var.env}/database/password"
  type  = "SecureString"
  value = random_password.db_password.result
}