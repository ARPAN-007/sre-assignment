resource "azurerm_key_vault" "sre_zeiss" {
  name                = "kv-sre-${random_string.suffix.result}"
  location            = azurerm_resource_group.sre_zeiss.location
  resource_group_name = azurerm_resource_group.sre_zeiss.name

  tenant_id = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  purge_protection_enabled   = false
  soft_delete_retention_days = 30

  enable_rbac_authorization = true
}

data "azurerm_client_config" "current" {}