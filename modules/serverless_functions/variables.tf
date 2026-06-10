#General
variable "environment" {
  type = string
}
variable "region" {
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
variable "private_subnet" {
  type = string
}
