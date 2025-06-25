output "web_app_url" {
  description = "URL publique de la Web App"
  value       = azurerm_linux_web_app.wordpress_app.default_hostname
}
