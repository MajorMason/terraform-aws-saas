#We need one integration resouce per AWS Lambda function
#The integration type of "AWS_PROXY" is a preset value that auto-forwards each full HTTP response to Lambda
resource "aws_apigatewayv2_integration" "integration" {
  for_each = local.api_integrations
  
  api_id = aws_apigatewayv2_api.api_gateway.id
  integration_type = var.integration_type
  integration_uri = each.value.integration_uri
  payload_format_version = var.payload_format
}
