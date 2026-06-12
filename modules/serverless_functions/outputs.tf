#Outputs
#Lambda Function Invoke ARNs
output "reader_function_invoke" {
  value = aws_lambda_function.data_reader.invoke_arn
}
output "writer_function_invoke" {
  value = aws_lambda_function.data_writer.invoke_arn
}
output "driver_function_invoke" {
  value = aws_lambda_function.data_driver.invoke_arn
}
#Lambda Function Names
output "reader_function_name" {
  value = aws_lambda_function.data_reader.function_name
}
output "writer_function_name" {
  value = aws_lambda_function.data_writer.function_name
}
output "driver_function_name" {
  value = aws_lambda_function.data_driver.function_name
}
