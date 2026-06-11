#AWS RDS instances are automatically kept private in your VPC including all its traffic.
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

  blue_green_update {
    enabled = true
  }
}
