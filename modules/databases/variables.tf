#General
variable "environment" {
  type = string
}
variable "region" {
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
variable "backup_retention_period" {
  type = string
}
variable "backup_window" {
  type = string
}
variable "maintenance_window" {
  type = string
}
variable "copy_tags_to_snapshot" {
  type = bool
}
variable "final_snapshot_identifier" {
  type = string
}
variable "deletion_protection" {
  type = bool
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

#Output Variables
#Security Groups
variable "rds_sg" {
  type = string
}
#Subnet Groups
variable "aws_db_subnet_group" {
  type = string
}
