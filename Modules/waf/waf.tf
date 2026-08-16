resource "aws_wafv2_web_acl" "alb_waf" {
  name        = "${var.env}-${var.aws_region}-alb-web-acl"
  description = "WAF protecting Application Load Balancer"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  ########################################
  # AWS Managed Common Rule Set
  ########################################

  rule {
    name     = "AWSManagedCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "CommonRuleSet"
      sampled_requests_enabled   = true
    }
  }

  ########################################
  # SQL Injection Protection
  ########################################

  rule {
    name     = "AWSManagedSQLiRuleSet"
    priority = 2

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "SQLiProtection"
      sampled_requests_enabled   = true
    }
  }

  ########################################
  # Rate Limiting
  ########################################

  rule {
    name     = "RateLimitRule"
    priority = 3

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = var.rate_limit
        aggregate_key_type = "IP"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "RateLimit"
      sampled_requests_enabled   = true
    }
  }

  ########################################
  # WAF Metrics
  ########################################

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.env}-alb-waf"
    sampled_requests_enabled   = true
  }

  tags = {
    Name        = "${var.env}-${var.aws_region}-alb-waf"
    Environment = var.env
  }
}