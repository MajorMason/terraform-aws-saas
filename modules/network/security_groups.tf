resource "aws_security_group" "lambda_sg" {
  vpc_id = aws_vpc.vpc.id

  # Allow Lambda to reach RDS (no SG reference needed)
  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  # Allow Lambda to reach VPC endpoints
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.lambda_sg.id]
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
#These three SGs ensure the Endpoint's Security Group allows inbound traffic from the
#Lambda Security Group, vice versa, as well as Lambda to RDS
