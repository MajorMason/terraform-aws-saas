#API Gateway
module "api_gateway" {
  source      = "./modules/api_gateway"
  environment = var.environment
  region      = var.region
  #API
  protocol_type = var.protocol_type
  allow_origins = var.allow_origins
  max_age       = var.max_age
  #Stage
  api_url_suffix = var.api_url_suffix
  auto_deploy    = var.auto_deploy
  #Route
  reader_route_key = var.reader_route_key
  writer_route_key = var.writer_route_key
  driver_route_key = var.driver_route_key
  #Integrations
  #Common
  integration_type       = var.integration_type
  reader_function_invoke = var.reader_function_invoke
  writer_function_invoke = var.writer_function_invoke
  driver_function_invoke = var.driver_function_invoke
  payload_format         = var.payload_format
  #Permissions
  reader_function_name = var.reader_function_name
  writer_function_name = var.writer_function_name
  driver_function_name = var.driver_function_name
}

#Frontend
module "frontend" {
  source      = "./modules/frontend"
  environment = var.environment
  region      = var.region
  #Amplify
  repository               = var.repository
  github_token             = var.github_token
  enable_branch_auto_build = var.enable_branch_auto_build
  branch_name              = var.branch_name
}

#Databases
module "databases" {
  source         = "./modules/databases"
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
  aws_db_subnet_group            = var.aws_db_subnet_group
  rds_sg                         = var.rds_sg
}

#Network
module "network" {
  source        = "./modules/network"
  environment   = var.environment
  region        = var.region
  service_name  = var.service_name
  cidr_block    = var.cidr_block
  private_block = var.private_block
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
  lambda_sg      = var.lambda_sg
  #Environments
  lambda_interface_endpoint = var.lambda_interface_endpoint
  aws_db_instance_primary   = var.aws_db_instance_primary
  db_username               = var.db_username
  db_password               = var.db_password
  primary_db_name           = var.primary_db_name
}
