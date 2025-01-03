terraform {
  backend "s3" {
    bucket = "my-s3-bucket-for-terraform-state-file"
    region = "us-east-1"
    key = "tf_state_folder/terraform.tfstate"
    encrypt = true
    dynamodb_table = "terraform-state-file-lock"
  }
}