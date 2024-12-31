# local_file provider - This will be create a .txt file
# resource build_In_function resource_name
resource local_file devops  { 
    filename = "/home/ali-fareed/Ali/DevOps/Terraform/terraform-local/terraform-first-local_file.txt"
    content = "First Local File with Content"
}

# random string provider
resource "random_string" "rand-str" {
    length = 16
    special = true
    override_special = "!@#$%^&*()+={}.?[]"
}

# To show output in terminal
output "rand-str" {
  value = random_string.rand-str[*].result
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
