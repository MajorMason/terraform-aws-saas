#General
variable "environment" {
  type = string
}
variable "region" {
  type = string
}

#Databases
variable "primary_db_name" {
  type = string
}
variable "db_username" {
  type = string
}
variable "db_password" {
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

#Database
variable "aws_db_instance_primary" {
  type = string
}
