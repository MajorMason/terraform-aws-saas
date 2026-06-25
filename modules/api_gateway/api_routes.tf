#The API Gateway route resources below each map 1:1 with their respective API Integration resources
#The route resource defines two things: Request Pattern & Path (GET, POST, etc. in tandem with path /read, /write, etc.)
resource "aws_apigatewayv2_route" "route" {
  for_each = local.api_routes

  api_id = aws_apigatewayv2_api.api_gateway.id
  route_key = each.value.route_key
  target = "integrations/${aws_apigatewayv2_integration.integration[each.key].id}"
}
#NOTE: The resource reference arguments like the api_id must be in our resource codeblock and NOT in our locals.tf file
#because locals.tf must only contain pure values
