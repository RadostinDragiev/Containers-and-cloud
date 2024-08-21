docker build . -f ./TaskBoard.WebApp/Dockerfile -t radostind/taskbard_app

docker login

docker push radostind/taskbard_app 