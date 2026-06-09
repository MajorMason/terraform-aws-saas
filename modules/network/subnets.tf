#This subnet gives us 256 total IP addresses
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_block

  tags = {
    environment = var.environment
  }
}
