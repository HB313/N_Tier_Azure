# Déploiement d'une Application WordPress N-Tier sur Azure

## 📦 Description

Ce projet met en place une infrastructure N-Tier sur Azure pour héberger un site WordPress conteneurisé. L'infrastructure est automatisée avec Terraform et repose sur :

- **Azure Resource Group**
- **Azure Container Registry (ACR)** : hébergement de l'image Docker WordPress personnalisée
- **Azure App Service (Linux)** : hébergement du conteneur
- **Azure MySQL Flexible Server** : base de données
- **Authentification managée** : rôle AcrPull entre App Service et ACR

---

## 🏗️ Architecture Technique

- Image Docker WordPress stockée sur ACR
- App Service Linux configuré pour tirer l'image du registre
- MySQL Flexible Server hébergeant la base de données WordPress
- Automatisation complète avec Terraform

---

## ⚠️ État du Projet

À l'heure actuelle, le déploiement de l'infrastructure est fonctionnel, mais le site WordPress n'est pas encore accessible en ligne. Les principales raisons sont :

- Difficultés d'interconnexion entre Azure App Service et ACR malgré le rôle `AcrPull`
- Blocages liés à la configuration dynamique des variables d'environnement dans Azure
- Limitations du portail Azure avec les tags d'images ACR non visibles

Les tests ont permis de valider :

✅ Création des ressources via Terraform  
✅ Image Docker personnalisée correctement buildée et poussée sur ACR  
✅ Paramétrage du conteneur côté App Service  
✅ Mise en place de l'authentification managée  

Mais l'accès final à l'URL de l'application reste non opérationnel.

---

## 🚀 Étapes de Déploiement (fonctionnelles)

1. **Terraform Infrastructure** :
   ```bash
   terraform init
   terraform apply -var-file="dev.tfvars" -auto-approve
