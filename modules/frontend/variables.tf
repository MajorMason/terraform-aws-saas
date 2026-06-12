#General
variable "environment" {
  type = string
}
variable "region" {
  type = string
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
