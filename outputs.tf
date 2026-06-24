output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "log_analytics_workspace" {
  value = azurerm_log_analytics_workspace.law.name
}

output "action_group_name" {
  value = azurerm_monitor_action_group.ag.name
}
