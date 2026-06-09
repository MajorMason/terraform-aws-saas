#Lambda permissions are per function, not per API Gateway
#As such, we need one permission block per function
resource "aws_lambda_permission" "allow_apigw_reader" {
  statement_id  = "AllowAPIGatewayInvokeReader"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.data_reader.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api_gateway.execution_arn}/*/*"
}

resource "aws_lambda_permission" "allow_apigw_writer" {
  statement_id  = "AllowAPIGatewayInvokeWriter"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.data_writer.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api_gateway.execution_arn}/*/*"
}

resource "aws_lambda_permission" "allow_apigw_driver" {
  statement_id  = "AllowAPIGatewayInvokeDriver"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.data_driver.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api_gateway.execution_arn}/*/*"
}
