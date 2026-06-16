#This is what actually places our RDS instances inside the VPC
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id]
}
