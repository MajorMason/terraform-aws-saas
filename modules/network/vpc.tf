resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  region = var.region

  tags = {
    environment = var.environment
  }
}
