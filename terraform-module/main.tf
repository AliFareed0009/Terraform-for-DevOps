provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules"
  ami_value = "ami-id" # replace this
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-id" # replace this
}