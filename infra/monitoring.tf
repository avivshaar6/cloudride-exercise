resource "aws_sns_topic" "container_errors" {
  name = "container-errors-alerts"
}

resource "aws_sns_topic_subscription" "container_errors_email" {
  topic_arn = aws_sns_topic.container_errors.arn
  protocol  = "email-json"
  endpoint  = "avivshaar6@gmail.com"
}

resource "aws_cloudwatch_log_metric_filter" "container_errors" {
  name           = "container-error-count"
  pattern        = "[ERROR, Error, error]"  
  log_group_name = "/ecs/${var.app_name}"

  metric_transformation {
    name          = "ContainerErrorCount"
    namespace     = "ECS/ContainerLogs"
    value         = "1"
    default_value = 0
  }
}

resource "aws_cloudwatch_metric_alarm" "container_error_count" {
  alarm_name          = "container-error-threshold"
  alarm_description   = "Alert when container logs show error messages"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ContainerErrorCount"
  namespace           = "ECS/ContainerLogs"
  period             = 10  
  statistic          = "Sum"
  threshold          = 1    

  alarm_actions = [aws_sns_topic.container_errors.arn]

  tags = {
    Service     = "${var.app_name}-service"
  }

  depends_on = [aws_cloudwatch_log_metric_filter.container_errors]
}