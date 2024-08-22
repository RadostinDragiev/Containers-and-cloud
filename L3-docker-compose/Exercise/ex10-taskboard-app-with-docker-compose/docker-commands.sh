# Created docker-compose.yaml to ex6-taskboard-app-image-build

# Create network
docker network create taskboard_network

# Docker compose build
docker compose build

# Docker compose up
docker compose up -d

# Clear all
docker compose down --rmi all -v