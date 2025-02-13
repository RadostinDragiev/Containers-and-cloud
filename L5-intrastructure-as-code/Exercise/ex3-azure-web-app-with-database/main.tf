terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.18.0"
    }
  }
}

# Get subscription_id using:
# az account show --query id --output tsv
provider "azurerm" {
  features {}
  subscription_id = ""
}

resource "azurerm_resource_group" "rado_group" {
  name     = "${var.resource_group_name}${random_integer.ri.result}"
  location = var.resource_group_location
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_service_plan" "azapsp" {
  name                = "${var.app_service_plan_name}-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.rado_group.name
  location            = azurerm_resource_group.rado_group.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "alwa" {
  name                = "${var.app_service_name}-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.rado_group.name
  location            = azurerm_service_plan.azapsp.location
  service_plan_id     = azurerm_service_plan.azapsp.id

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = "Data Source=tcp:${azurerm_mssql_server.azmsdbs.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.azmsdb.name};User ID=${azurerm_mssql_server.azmsdbs.administrator_login};Password=${azurerm_mssql_server.azmsdbs.administrator_login_password};Trusted_Connection=False; MultipleActiveResultSets=True;"
  }

  site_config {
    application_stack {
      dotnet_version = "6.0"
    }
    always_on = false
  }
}

resource "azurerm_mssql_server" "azmsdbs" {
  name                         = "${var.sql_server_name}-${random_integer.ri.result}"
  resource_group_name          = azurerm_resource_group.rado_group.name
  location                     = azurerm_resource_group.rado_group.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "azmsdb" {
  name           = "${var.sql_database_name}${random_integer.ri.result}"
  server_id      = azurerm_mssql_server.azmsdbs.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
  sku_name       = "S0"
  zone_redundant = false
}

resource "azurerm_mssql_firewall_rule" "azmsfr" {
  name             = var.firewall_rule_name
  server_id        = azurerm_mssql_server.azmsdbs.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_app_service_source_control" "azassc" {
  app_id                 = azurerm_linux_web_app.alwa.id
  repo_url               = var.repo_URL
  branch                 = "main"
  use_manual_integration = true
}