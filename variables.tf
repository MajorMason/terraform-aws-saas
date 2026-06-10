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

#Frontend
variable "repository" {
  type = string
}
variable "github_token" {
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

#Output Variables
#Network
variable "private_subnet" {
  type = string
}
