# Utilise l'image officielle WordPress
FROM wordpress:latest

# Ajoute un fichier HTML visible depuis le site
COPY fichiers_wordpress_personnalises/tp-info.html /var/www/html/tp-info.html

# Optionnel : Personnalisation basique de la page d'accueil
RUN echo '<!-- Rendu du TP N-Tier Azure avec WordPress personnalisé -->' >> /var/www/html/index.php


