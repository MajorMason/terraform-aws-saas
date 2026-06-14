#The API Gateway API resource below is what generates the public URL our Amplify app will call
resource "aws_apigatewayv2_api" "api_gateway" {
  name          = "${var.environment}-api-gateway"
  protocol_type = var.protocol_type

  cors_configuration {
    allow_origins = var.allow_origins  # or your Amplify domain
    allow_methods = ["GET", "POST", "OPTIONS"]
    allow_headers = ["content-type", "authorization"]
    expose_headers = []
    max_age = var.max_age
  }
}

#The API Gateway Stage resource adds the URL suffix on the end such as "/prod", "/dev", etc.
#However in our case, we are leveraging "$default" which keeps the URL cleaner without extensions
resource "aws_apigatewayv2_stage" "api_stage" {
  api_id      = aws_apigatewayv2_api.api_gateway.id
  name        = var.api_url_suffix
  auto_deploy = var.auto_deploy
}
#The complete flow from FE to BE is:
#Frontend → API URL → Stage → Route → Integration → Lambda
