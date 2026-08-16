output "guardduty_detector_id" {
  description = "GuardDuty Detector ID"
  value       = aws_guardduty_detector.security.id
}

output "guardduty_detector_arn" {
  description = "GuardDuty Detector ARN"
  value       = aws_guardduty_detector.security.arn
}