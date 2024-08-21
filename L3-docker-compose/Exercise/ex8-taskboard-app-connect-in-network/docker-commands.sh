docker network create taskboard_network

docker run -e ACCEPT_EULA=Y -e MSSQL_SA_PASSWORD=yourStringPassword12# -p 1433:1433 -v sqldata:/var/opt/mssql --rm --network taskboard_network --name sqlserver -d mcr.microsoft.com/mssql/server

docker build . -f ./TaskBoard.WebApp/Dockerfile -t radostind/taskbard_app

docker run -d -p 5001:80 --rm --name web_app --network taskboard_network radostind/taskbard_app