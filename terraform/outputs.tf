output "resource_group_name" {
  value = azurerm_resource_group.sre_zeiss.name
}

output "acr_name" {
  value = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "servicebus_namespace" {
  value = azurerm_servicebus_namespace.sre_zeiss.name
}

output "servicebus_queue" {
  value = azurerm_servicebus_queue.work.name
}

output "application_insights_name" {
  value = azurerm_application_insights.sre_zeiss.name
}

output "key_vault_name" {
  value = azurerm_key_vault.sre_zeiss.name
}