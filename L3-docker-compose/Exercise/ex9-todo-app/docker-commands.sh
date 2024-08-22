# Create two networks react-express and express-mongo
docker network create react-express
docker network create express-mongo

# Run mongo container
docker run -d --name mongo -v ./data:/data/db --network express-mongo mongo:latest

# Build backend Dockerfile
docker build -f ./Dockerfile -t backend_image .

# Run backend container
docker run -d --network express-mongo --name backend backend_image

# Add backend container to react-express network
docker network connect react-express backend

# Build frontend Dockerfile
docker build -f ./Dockerfile -t frontend_image .

# Run frontend container
docker run -d --network react-express --name frontend -p 3000:3000 frontend_image