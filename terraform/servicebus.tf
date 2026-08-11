resource "azurerm_servicebus_namespace" "sre_zeiss" {
  name                = "sre-assessment-sb-${random_string.suffix.result}"
  location            = azurerm_resource_group.sre_zeiss.location
  resource_group_name = azurerm_resource_group.sre_zeiss.name

  sku = "Standard"
}

resource "azurerm_servicebus_queue" "work" {
  name         = "work-queue"
  namespace_id = azurerm_servicebus_namespace.sre_zeiss.id

  max_delivery_count = 5
}