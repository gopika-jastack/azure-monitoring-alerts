terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "demo-loganalytics"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku               = "PerGB2018"
  retention_in_days = 30
}

resource "azurerm_monitor_action_group" "ag" {
  name                = "critical-alerts"
  resource_group_name = azurerm_resource_group.rg.name
  short_name          = "alerts"

  email_receiver {
    name          = "admin"
    email_address = "admin@example.com"
  }
}
