# resource "aws_cloudwatch_metric_alarm" "task_errors" {
#   alarm_name          = "hello-world-task-errors"
#   comparison_operator = "GreaterThanThreshold"
#   evaluation_periods  = "1"
#   metric_name        = "RunningTaskCount"
#   namespace          = "AWS/ECS"
#   period             = "300"
#   statistic          = "Average"
#   threshold          = "0"
#   alarm_description  = "This metric monitors ecs task errors"
#   alarm_actions      = [] # Add SNS topic ARN here if needed

#   dimensions = {
#     ClusterName = aws_ecs_cluster.main.name
#     ServiceName = aws_ecs_service.app.name
#   }
# }