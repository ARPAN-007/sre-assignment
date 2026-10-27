terraform {
  backend "azurerm" {
    resource_group_name  = "rg-sre-terraform-state"
    storage_account_name = "sretfstateuto9xe"
    container_name       = "tfstate"
    key                  = "sre-assignment-dev.tfstate"

    use_azuread_auth = true
  }
}

