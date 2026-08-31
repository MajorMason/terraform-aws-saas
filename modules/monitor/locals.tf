locals {
    cloudwatch_alarms = {
        reader_errors = {
            alarm_name = "lambda-errors-${var.reader_function_name}"
            evaluation_periods = 2
            metric_name = "Errors"
            statistic = "Sum"
            threshold = 5
            dimensions = {FunctionName = var.reader_function_name}
        }
        reader_duration = {
            alarm_name = "lambda-duration-${var.reader_function_name}"
            evaluation_periods = 3
            metric_name = "Duration"
            extended_statistic  = "p95"
            threshold = 1 * 0.8
            dimensions = {FunctionName = var.reader_function_name}
        }
        #Throttle alarm is for when an invocation request was rejected before execution because the function hit its concurrency limit
        reader_throttle = {
            alarm_name = "lambda-throttles-${var.reader_function_name}"
            evaluation_periods = 1
            metric_name = "Throttles"
            statistic = "Sum"
            threshold = 0
            dimensions = {FunctionName = var.reader_function_name}
        }
    }
}