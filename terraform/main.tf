resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_resource_group" "sre_zeiss" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location
}