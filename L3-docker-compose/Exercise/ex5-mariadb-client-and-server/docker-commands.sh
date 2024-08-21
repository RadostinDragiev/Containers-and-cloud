docker network create mariadb_network 

docker run -d --network mariadb_network --name mariadb_server -e MARIADB_USER=example-user -e MARIADB_PASSWORD=my_cool_secret -e MARIADB_ROOT_PASSWORD=my-secret-pw  mariadb:latest

docker run --name mariadb_client -it --network mariadb_network --rm mariadb:latest mariadb -hmariadb_server -uexample-user -p

SELECT VERSION();