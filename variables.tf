variable "resource_group_name" {
  description = "Nom du groupe de ressources"
}

variable "location" {
  description = "Région Azure"
}

variable "app_service_plan_name" {
  description = "Nom du plan App Service"
}

variable "web_app_name" {
  description = "Nom de la Web App"
}

variable "image_name" {
  description = "Nom de l'image Docker"
}

variable "mysql_flexible_server_name" {
  description = "Nom du serveur MySQL Flexible"
}

variable "mysql_admin_username" {
  description = "Utilisateur MySQL"
}

variable "mysql_admin_password" {
  description = "Mot de passe MySQL"
  sensitive   = true
}

