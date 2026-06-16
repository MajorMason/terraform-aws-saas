#Outputs
#Interface Endpoint
output "lambda_interface_endpoint" {
  value = aws_vpc_endpoint.lambda_interface_endpoint.dns_entry[0].dns_name
}
#Security Groups
output "lambda_sg" {
  value = aws_security_group.lambda_sg.id
}
output "rds_sg" {
  value = aws_security_group.rds_sg.id
}
#Subnets
output "private_subnet_group" {
  value = aws_db_subnet_group.db_subnet_group.name
}
output "private_subnet" {
  value = aws_subnet.private_subnet.id
}
