variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Group location"
}

variable "app_service_plan_name" {
  type        = string
  description = "Name of service plan"
}

variable "app_service_name" {
  type        = string
  description = "Name of rapp"
}

variable "sql_server_name" {
  type        = string
  description = "Name of sql server"
}

variable "sql_database_name" {
  type        = string
  description = "Name of database"
}

variable "sql_admin_login" {
  type        = string
  description = "Admin login"
}

variable "sql_admin_password" {
  type        = string
  description = "Admin password"
}

variable "firewall_rule_name" {
  type        = string
  description = "Firewall rule name"
}

variable "repo_URL" {
  type        = string
  description = "Repo url"
}