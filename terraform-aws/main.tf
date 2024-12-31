terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "us-east-1"
#  access_key = "AWS_ACCESS_KEY_ID"
#  secret_key = "AWS_SECRET_ACCESS_KEY_ID"
}

resource "aws_instance" "ubuntu-vm" {
  ami = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-vm"
  }
}

output "public_ip" {
    value = aws_instance.ubuntu-vm.public_ip
}