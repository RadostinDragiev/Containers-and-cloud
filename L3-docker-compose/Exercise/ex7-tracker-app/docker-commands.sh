docker build . -f ./Dockerfile -t radostind/tracker_app

docker login

docker push radostind/tracker_app

docker run -d --name tracker_app -p 8080:80 radostind/tracker_app