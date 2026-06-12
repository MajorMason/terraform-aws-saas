#We need one integration resouce per AWS Lambda function
#The integration type of "AWS_PROXY" is a preset value that auto-forwards each full HTTP response to Lambda
resource "aws_apigatewayv2_integration" "reader_integration" {
  api_id                 = aws_apigatewayv2_api.api_gateway.id
  integration_type       = var.integration_type
  integration_uri        = var.reader_function_invoke
  payload_format_version = var.payload_format
}

resource "aws_apigatewayv2_integration" "writer_integration" {
  api_id                 = aws_apigatewayv2_api.api_gateway.id
  integration_type       = var.integration_type
  integration_uri        = var.writer_function_invoke
  payload_format_version = var.payload_format
}

resource "aws_apigatewayv2_integration" "driver_integration" {
  api_id                 = aws_apigatewayv2_api.api_gateway.id
  integration_type       = var.integration_type
  integration_uri        = var.driver_function_invoke
  payload_format_version = var.payload_format
}
