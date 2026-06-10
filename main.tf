#Network
module "network" {
  source        = "./modules/network"
  environment   = var.environment
  region        = var.region
  cidr_block    = var.cidr_block
  private_block = var.private_block
}

#Serverless Functions
module "serverless_functions" {
  source         = "./modules/serverless_functions"
  environment    = var.environment
  region         = var.region
  private_subnet = var.private_subnet
}
