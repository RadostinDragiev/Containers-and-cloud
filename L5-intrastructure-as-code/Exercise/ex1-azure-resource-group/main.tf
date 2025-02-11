terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.89.0"
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
  name     = "radorg"
  location = "West Europe"
}