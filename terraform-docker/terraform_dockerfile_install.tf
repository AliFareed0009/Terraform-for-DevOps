# terraform block
terraform {
  required_providers {
    docker = {
        source  = "kreuzwerker/docker"
        version = "3.0.2"
    }
  }
}

# terraform block
provider "docker" {}

# resource block 
resource "docker_image" "nginx-container" {
   name = "nginx:latest"
   keep_locally = false
}

resource "docker_container" "nginx-image" {
    image = docker_image.nginx-container.name
    name = "nginx-tf"
    ports {
        internal = 80
        external = 80
    }
}

# Enter the following commands to run this file

# Go to the directory where this file is place 
#cd /PATH

# This is used to intialize terraform
# terraform init

# This is used to see wat will be created
# terraform plan

# This is used to create
# terraform apply

# This is used to delete all resources
# terraform destroy