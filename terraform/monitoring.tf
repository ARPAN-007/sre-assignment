resource "azurerm_log_analytics_workspace" "sre_zeiss" {
  name                = "law-${var.project_name}-${var.environment}"
  location            = azurerm_resource_group.sre_zeiss.location
  resource_group_name = azurerm_resource_group.sre_zeiss.name

  sku               = "PerGB2018"
  retention_in_days = 30
}

resource "azurerm_application_insights" "sre_zeiss" {
  name                = "appi-${var.project_name}-${var.environment}"
  location            = azurerm_resource_group.sre_zeiss.location
  resource_group_name = azurerm_resource_group.sre_zeiss.name

  application_type = "web"
  workspace_id     = azurerm_log_analytics_workspace.sre_zeiss.id
}