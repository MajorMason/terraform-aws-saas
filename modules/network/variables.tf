#General
variable "environment" {
  type = string
}
variable "region" {
  type = string
}

#Network
#Subnets
variable "private_block" {
  type = string
}
#VPC
variable "cidr_block" {
  type = string
}
