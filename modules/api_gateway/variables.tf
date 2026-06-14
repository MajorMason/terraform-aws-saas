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
variable "max_age" {
  type = number
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

#Output Variables
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
