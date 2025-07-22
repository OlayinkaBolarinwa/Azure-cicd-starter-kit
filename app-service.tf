resource "azurerm_app_service" "web_app" {
  name                = "ybee-webapp-0722xyz"
  location            = azurerm_resource_group.rg_resource.location
  resource_group_name = azurerm_resource_group.rg_resource.name
  app_service_plan_id = azurerm_service_plan.app_plan.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}
