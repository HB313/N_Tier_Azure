resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = "acrntierfr"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                   = var.mysql_flexible_server_name
  location               = azurerm_resource_group.main.location
  resource_group_name    = azurerm_resource_group.main.name
  administrator_login    = var.mysql_admin_username
  administrator_password = var.mysql_admin_password
  sku_name               = "B_Standard_B1ms"
  version                = "5.7"

  storage {
    size_gb = 20
  }
}

resource "azurerm_linux_web_app" "wordpress_app" {
  name                = var.web_app_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    application_stack {
      docker_image_name   = "${azurerm_container_registry.acr.login_server}/${var.image_name}"
      docker_registry_url = "https://${azurerm_container_registry.acr.login_server}"
    }

    always_on = true
  }

  app_settings = {
    "WEBSITES_PORT"               = "8081"
    "WORDPRESS_DB_HOST"           = "${azurerm_mysql_flexible_server.mysql_server.fqdn}"
    "WORDPRESS_DB_USER"           = var.mysql_admin_username
    "WORDPRESS_DB_PASSWORD"       = var.mysql_admin_password
    "WORDPRESS_DB_NAME"           = "wordpress"
  }
}
