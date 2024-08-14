# Pull image from hub
docker pull #[image name]

# Lists all local images
docker images

# Run image
docker run #[image name]

# Run image with my naming
docker run --name mycustomname nginxdemos/hello

# Run image with my naming at detached mode
docker run --name mycustomname -d nginxdemos/hello

# Run image with my naming at detached mode, mapped to port 8080
docker run --name mycustomname -d -p 8080:80 nginxdemos/hello

# Run image with volume with local file(OR) volume
docker run --name mycustomname -d -p 8080:80 -v {folder-name/volume}:{container-folder} nginxdemos/hello

# Delete image
docker rmi #[image name]

# Lists all running containers
docker ps

# Lists all containers
docker ps - a

# Stop container
docker stop #[container ID/name]

# Delete container
docker rm #[container ID/name]

# Fetch container logs
docker logs #[container ID/name]

# Fetch container logs in follow mode
docker logs #[container ID/name] - f

# Interactive mode
docker exec -it {container name} /bin/sh

# Create volume
docker volume create #[volume name]

# Lists volumes
docker volume ls

# Inspect volume
docker volume inspect #[volume-name]

# Delete volume
docker volume rm #[volume-name]