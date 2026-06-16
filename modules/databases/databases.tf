#AWS RDS instances need the db_subnet_group_name plus a security group for proper integration with the VPC
#Over on our Lambda functions that communicate with our PostgreSQL DB instance, they just leverage
#the DB_HOST, name, pass and user arguments to find the DB
resource "aws_db_instance" "primary_db" {
  region               = var.region
  allocated_storage    = var.primary_allocated_storage
  db_name              = var.primary_db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = var.primary_skip_final_snapshot
  db_subnet_group_name = var.aws_db_subnet_group
  vpc_security_group_ids = [var.rds_sg]

  blue_green_update {
    enabled = true
  }
}

resource "aws_db_instance" "repository_db" {
  region               = var.region
  allocated_storage    = var.repository_allocated_storage
  db_name              = var.repository_db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = var.repository_skip_final_snapshot
  db_subnet_group_name = var.aws_db_subnet_group
  vpc_security_group_ids = [var.rds_sg]

  blue_green_update {
    enabled = true
  }
}
