# Utilisation de l'image Python officielle comme base
FROM python:3.11-slim

# Définition du répertoire de travail
WORKDIR /app

# Copie des fichiers de l'application dans le container
COPY voting-app/ /app

# Installation des dépendances
RUN pip install --no-cache-dir flask requests redis

# Exposition du port 80
EXPOSE 80

# Healthcheck sur le service
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:80 || exit 1

# Lancement de l'application
CMD ["python3", "main.py"]
