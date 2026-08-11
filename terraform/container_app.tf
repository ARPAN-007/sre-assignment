resource "azurerm_container_app_environment" "sre_zeiss" {
  name                = "cae-${var.project_name}-${var.environment}"
  location            = azurerm_resource_group.sre_zeiss.location
  resource_group_name = azurerm_resource_group.sre_zeiss.name

  logs_destination         = "log-analytics"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sre_zeiss.id
}

resource "azurerm_container_app" "sre_zeiss" {
  name                         = "ca-${var.project_name}-${var.environment}"
  container_app_environment_id = azurerm_container_app_environment.sre_zeiss.id
  resource_group_name          = azurerm_resource_group.sre_zeiss.name

  revision_mode = "Single"

  identity {
    type = "UserAssigned"

    identity_ids = [
      azurerm_user_assigned_identity.container_app.id
    ]
  }

  registry {
    server   = azurerm_container_registry.acr.login_server
    identity = azurerm_user_assigned_identity.container_app.id
  }

  template {
    container {
      name   = "sre-api"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }

    min_replicas = 1
    max_replicas = 1
  }

  ingress {
    external_enabled           = true
    allow_insecure_connections = true
    target_port                = 8000

    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }

  depends_on = [
    azurerm_role_assignment.acr_pull
  ]
}