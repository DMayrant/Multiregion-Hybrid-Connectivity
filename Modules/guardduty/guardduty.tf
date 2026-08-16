############################################
# GuardDuty Detector
############################################

resource "aws_guardduty_detector" "security" {
  enable = true

  tags = {
    Name = "${var.env}-guardduty"
  }
}

############################################
# Runtime Monitoring
############################################

resource "aws_guardduty_detector_feature" "runtime_monitoring" {
  detector_id = aws_guardduty_detector.security.id
  name        = "RUNTIME_MONITORING"
  status      = "ENABLED"
}

############################################
# S3 Protection
############################################

resource "aws_guardduty_detector_feature" "s3_protection" {
  detector_id = aws_guardduty_detector.security.id
  name        = "S3_DATA_EVENTS"
  status      = "ENABLED"
}

############################################
# Malware Protection
############################################

resource "aws_guardduty_detector_feature" "malware_protection" {
  detector_id = aws_guardduty_detector.security.id
  name        = "EBS_MALWARE_PROTECTION"
  status      = "ENABLED"
}