resource "aws_security_group" "lambda_sg" {
  vpc_id = aws_vpc.vpc.id
  
  # Allow Lambda to send traffic to the VPC endpoint
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }
}

resource "aws_security_group" "endpoint_sg" {
  vpc_id = aws_vpc.vpc.id
  
  # Allow inbound traffic from Lambda SG
  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "TCP"
    security_groups = [aws_security_group.lambda_sg.id]
  }
}
#These two SGs ensure the Endpoint's Security Group allows inbound traffic from the
#Lambda Security Group, vice versa
