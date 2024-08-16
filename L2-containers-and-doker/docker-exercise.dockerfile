# Exercise 1. Lightstreamer Container
docker pull lightstreamer:latest
docker run --name ls-server -d -p 80:8080 lightstreamer:latest


# Exercise 2. Ghost Container
docker pull ghost
docker run --name ghost-container -d -p 3001:2368 -e NODE_ENV=development ghost

# Exercise 3. Apache HTTP Server Container
docker pull httpd:latest
docker run --name my-apache-app -d -p 8080:80 -v ${PWD}/data:/usr/local/apache2/htdocs/ httpd:latest

# Exercise 4. SQL Server Container
docker run -e ACCEPT_EURLA=Y -e MSSQL_SA_PASSWORD=yourStrongPassword12# -p 1433:1433 -v sqldata:/var/opt/mssql -d mcr.microsoft.com/mssql/server
