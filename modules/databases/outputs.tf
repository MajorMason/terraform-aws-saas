#Outputs
output "aws_db_instance_primary" {
  value = aws_db_instance.primary_db.address
}
