#The API Gateway route resources below each map 1:1 with their respective API Integration resources
#The route resource defines two things: Request Pattern & Path (GET, POST, etc. in tandem with path /read, /write, etc.)
resource "aws_apigatewayv2_route" "reader_route" {
  api_id    = aws_apigatewayv2_api.api_gateway.id
  route_key = var.reader_route_key
  target    = "integrations/${aws_apigatewayv2_integration.reader_integration.id}"
}

resource "aws_apigatewayv2_route" "writer_route" {
  api_id    = aws_apigatewayv2_api.api_gateway.id
  route_key = var.writer_route_key
  target    = "integrations/${aws_apigatewayv2_integration.writer_integration.id}"
}

resource "aws_apigatewayv2_route" "driver_route" {
  api_id    = aws_apigatewayv2_api.api_gateway.id
  route_key = var.driver_route_key
  target    = "integrations/${aws_apigatewayv2_integration.driver_integration.id}"
}
