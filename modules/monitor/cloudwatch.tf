#Data Reader
resource "aws_cloudwatch_metric_alarm" "reader_lambda_errors" {
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

#Data Writer Alarms
resource "aws_cloudwatch_metric_alarm" "writer_lambda_errors" {
  alarm_name          = "lambda-errors-${var.writer_function_name}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Sum"
  threshold           = 5
  dimensions          = {FunctionName = var.writer_function_name}
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "writer_lambda_duration" {
  alarm_name          = "lambda-duration-${var.writer_function_name}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 3
  metric_name         = "Duration"
  namespace           = "AWS/Lambda"
  period              = 300
  extended_statistic  = "p95"
  threshold           = 1 * 0.8
  dimensions          = {FunctionName = var.writer_function_name}
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "writer_lambda_throttles" {
  alarm_name          = "lambda-throttles-${var.writer_function_name}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Throttles"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Sum"
  threshold           = 0
  dimensions          = {FunctionName = var.writer_function_name}
  alarm_actions       = [aws_sns_topic.alerts.arn]
}
