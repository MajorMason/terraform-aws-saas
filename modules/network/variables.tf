#General
variable "environment" {
  type = string
}
variable "region" {
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
