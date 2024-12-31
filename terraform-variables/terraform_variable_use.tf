# Fetching variable values from variable.tf file
resource "local_file" "devops-var" {
  filename = var.file_name
  content = var.content
}

# This will show the output in terminal - variable is declared in variable.tf and initialized in terminal
# wrtie in terminal : export TF_VAR_devops_variable_terminal=insert_value
output "devops_variable_terminal_output" {
  value = var.devops_variable_terminal
}