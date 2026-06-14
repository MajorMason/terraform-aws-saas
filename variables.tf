#Global Variables File
#General
variable "environment" {
  type = string
}
variable "region" {
  type = string
}

#API_Gateway
#API
variable "protocol_type" {
  type = string
}
variable "allow_origins" {
  type = list(string)
}
#API_Stage
variable "api_url_suffix" {
  type = string
}
variable "auto_deploy" {
  type = bool
}
#API_Integrations
variable "integration_type" {
  type = string
}
variable "payload_format" {
  type = string
}
#API_Routes
variable "reader_route_key" {
  type = string
}
variable "writer_route_key" {
  type = string
}
variable "driver_route_key" {
  type = string
}

#Databases
#Common
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type = string
}
variable "db_username" {
  type = string
}
variable "db_password" {
  type = string
}
#Primary DB
variable "primary_allocated_storage" {
  type = number
}
variable "primary_db_name" {
  type = string
}
variable "primary_skip_final_snapshot" {
  type = bool
}
#Repository DB
variable "repository_allocated_storage" {
  type = number
}
variable "repository_db_name" {
  type = string
}
variable "repository_skip_final_snapshot" {
  type = bool
}

#Frontend
variable "repository" {
  type = string
}
variable "github_token" {
  type = string
}
variable "enable_branch_auto_build" {
  type = bool
}
variable "branch_name" {
  type = string
}

#Network
#Interface Endpoints
variable "service_name" {
  type = string
}
#Subnets
variable "private_block" {
  type = string
}
#VPC
variable "cidr_block" {
  type = string
}

#Serverless Functions
variable "handler" {
  type = string
}
variable "runtime" {
  type = string
}
variable "timeout" {
  type = number
}
variable "memory_size" {
  type = number
}

#Output Variables
#Database
variable "aws_db_instance_primary" {
  type = string
}

#Network
variable "lambda_interface_endpoint" {
  type = string
}
variable "lambda_sg" {
  type = string
}
variable "private_subnet" {
  type = string
}

#Serverless Functions
#Lambda Function Invoke ARNs
variable "reader_function_invoke" {
  type = string
}
variable "writer_function_invoke" {
  type = string
}
variable "driver_function_invoke" {
  type = string
}
#Lambda Function Names
variable "reader_function_name" {
  type = string
}
variable "writer_function_name" {
  type = string
}
variable "driver_function_name" {
  type = string
}
