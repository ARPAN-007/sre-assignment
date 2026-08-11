resource "azurerm_container_registry" "acr" {
  name                = "sreassessmentacr${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.sre_zeiss.name
  location            = azurerm_resource_group.sre_zeiss.location

  sku           = "Basic"
  admin_enabled = false
}