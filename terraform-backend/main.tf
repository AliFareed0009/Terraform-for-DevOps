provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_instance" {
  instance_type = "t2.micro"
  ami = "ami-id"
  subnet_id = "subnet-id"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-s3-bucket-for-terraform-state-file"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-state-file-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}