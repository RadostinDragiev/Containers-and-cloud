# Exercise 1. Lightstreamer Container
docker pull lightstreamer:latest
docker run --name ls-server -d -p 80:8080 lightstreamer:latest


# Exercise 2. Ghost Container
docker pull ghost
docker run --name ghost-container -d -p 3001:2368 -e NODE_ENV=development ghost

# Exercise 3. Apache HTTP Server Container
