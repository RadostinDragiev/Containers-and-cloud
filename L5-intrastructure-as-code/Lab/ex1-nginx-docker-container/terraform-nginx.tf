terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///Users/radostindragiev/.docker/run/docker.sock"
}

resource "docker_image" "nginx_image" {
  name = "nginxdemos/hello"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.name
  name  = "nginx_hello"

  ports {
    internal = 80
    external = 8000
  }
}