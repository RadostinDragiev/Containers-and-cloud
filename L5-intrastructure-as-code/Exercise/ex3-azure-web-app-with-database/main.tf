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
  name     = "TaskBoardRG${random_integer.ri.result}"
  location = "West Europe"
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_service_plan" "azapsp" {
  name                = "task-board-plan-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.rado_group.name
  location            = azurerm_resource_group.rado_group.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "alwa" {
  name                = "task-board-${random_integer.ri.result}"
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
  name                         = "task-board-sql-${random_integer.ri.result}"
  resource_group_name          = azurerm_resource_group.rado_group.name
  location                     = azurerm_resource_group.rado_group.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "azmsdb" {
  name           = "TaskBoardDB${random_integer.ri.result}"
  server_id      = azurerm_mssql_server.azmsdbs.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
  sku_name       = "S0"
  zone_redundant = false
}

resource "azurerm_mssql_firewall_rule" "azmsfr" {
  name             = "FirewallRule1"
  server_id        = azurerm_mssql_server.azmsdbs.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_app_service_source_control" "azassc" {
  app_id                 = azurerm_linux_web_app.alwa.id
  repo_url               = "https://github.com/RadostinDragiev/task-board"
  branch                 = "main"
  use_manual_integration = true
}