terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "flaskoshop" {
  name         = "rajasekarans/flask-o-shop:latest"
  keep_locally = false
}

resource "docker_container" "flaskoshopcontain" {
  image = docker_image.flaskoshop.image_id
  name  = "myshop"
  ports {
    internal = 5000
    external = 5000
  }
}
