#We only need a single interface endpoint that points to:
#com.amazonaws.east-us-1.lambda
#This endpoint is solely required to allow the Lambda functions to call each other from within the VPC
resource "aws_vpc_endpoint" "lambda_interface_endpoint" {
  vpc_id       = aws_vpc.vpc.id
  service_name = var.service_name
  vpc_endpoint_type = "Interface"

  subnet_ids = [aws_subnet.private_subnet.id]
  security_group_ids = [aws_security_group.lambda_sg]
  private_dns_enabled = true

  tags = {
    environment = var.environment
  }
}
#With "private_dns_enabled" set to "true" AWS automatically takes care of ALL the DNS handling
#behind the scenes, unlike over in Azure where we had to manually create DNS Zone + Link resources
#See architecture notes for further details
