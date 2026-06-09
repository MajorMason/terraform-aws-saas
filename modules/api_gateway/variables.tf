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
