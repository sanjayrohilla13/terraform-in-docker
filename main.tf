terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.15.0"
    }
  }
}

provider "docker" {}
#Pull a container image
resource "docker_image" "nodered_image" {
  name = "nodered/node-red"
}

# Run a container
resource "docker_container" "nodered_container" {
  name  = "nodered-container"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }
}
