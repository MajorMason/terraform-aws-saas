#General
variable "environment" {
  type = string
}
variable "region" {
  type = string
}

#Network
#VPC
variable "cidr_block" {
  type = string
}
#Subnets
variable "private_block" {
  type = string
}
