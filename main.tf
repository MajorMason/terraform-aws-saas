#Network
module "network" {
  source        = "./modules/network"
  environment   = var.environment
  region        = var.region
  cidr_block    = var.cidr_block
  private_block = var.private_block
}

#Databases
module "databases" {
  source = "./modules/databases"
  #Common
  environment    = var.environment
  region         = var.region
  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  db_username    = var.db_username
  db_password    = var.db_password
  #Primary DB
  primary_allocated_storage   = var.primary_allocated_storage
  primary_db_name             = var.primary_db_name
  primary_skip_final_snapshot = var.primary_skip_final_snapshot
  #Repository DB
  repository_allocated_storage   = var.repository_allocated_storage
  repository_db_name             = var.repository_db_name
  repository_skip_final_snapshot = var.repository_skip_final_snapshot
}

#Serverless Functions
module "serverless_functions" {
  source      = "./modules/serverless_functions"
  environment = var.environment
  region      = var.region
  handler     = var.handler
  runtime     = var.runtime
  timeout     = var.timeout
  memory_size = var.memory_size
  #VPC Config
  private_subnet = var.private_subnet
  #Environments
  aws_db_instance_primary = var.aws_db_instance_primary
  db_username             = var.db_username
  db_password             = var.db_password
  primary_db_name         = var.primary_db_name
}
