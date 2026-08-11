resource "azurerm_user_assigned_identity" "container_app" {
  name                = "id-${var.project_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.sre_zeiss.name
  location            = azurerm_resource_group.sre_zeiss.location
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.container_app.principal_id
}