#Data Reader & Writer
resource "aws_cloudwatch_metric_alarm" "metric_alarm" {
  for_each = local.cloudwatch_alarms

  alarm_name          = each.value.alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = each.value.evaluation_periods
  metric_name         = each.value.metric_name
  namespace           = "AWS/Lambda"
  period              = 300
  threshold           = each.value.threshold
  dimensions          = each.value.dimensions
  alarm_actions       = [aws_sns_topic.alerts.arn]

  # Safely handle mutually exclusive or optional statistic arguments
  statistic          = try(each.value.statistic, null)
  extended_statistic = try(each.value.extended_statistic, null)
}
