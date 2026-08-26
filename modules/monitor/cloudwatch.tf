#Data Reader Alarms
#Error alarm
resource "aws_cloudwatch_metric_alarm" "reader_lambda_errors" {
  alarm_name          = "lambda-errors-${var.reader_function_name}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Sum"
  threshold           = 5
  dimensions          = {FunctionName = var.reader_function_name}
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

#Duration alarm (p95 approaching timeout)
resource "aws_cloudwatch_metric_alarm" "reader_lambda_duration" {
  alarm_name          = "lambda-duration-${var.reader_function_name}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 3
  metric_name         = "Duration"
  namespace           = "AWS/Lambda"
  period              = 300
  extended_statistic  = "p95"
  threshold           = 1 * 0.8
  dimensions          = {FunctionName = var.reader_function_name}
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

#Throttle alarm is for when an invocation request was rejected before execution because the function hit its concurrency limit
resource "aws_cloudwatch_metric_alarm" "reader_lambda_throttles" {
  alarm_name          = "lambda-throttles-${var.reader_function_name}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Throttles"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Sum"
  threshold           = 0
  dimensions          = {FunctionName = var.reader_function_name}
  alarm_actions       = [aws_sns_topic.alerts.arn]
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
