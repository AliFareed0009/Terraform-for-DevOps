# Fetching datatype map from varibales file

resource "local_file" "dataType_Map" {
    filename = "/home/ali-fareed/Ali/DevOps/Terraform/terraform-dataType/test_file.txt"
    content = var.content_map["content1"]
}

output "Map_output" {
    value = var.content_map.content1
}

# This will replace the content of test_file.txt
resource "local_file" "dataType_Map_2" {
    filename = "/home/ali-fareed/Ali/DevOps/Terraform/terraform-dataType/test_file.txt"
    content = var.content_map["content2"]
}

# This will create a file from list data type index 0 
resource "local_file" "dataType_List" {
  filename = var.file_list[0]
  content = "Test content"
}

output "List_output" {
    value = var.file_list[1]
}

# This will create another file from list data type index 1
resource "local_file" "dataType_List_index1" {
  filename = var.file_list[1]
  content = "Test content_2"
}

# This will create a file from object data type
resource "local_file" "object_var" {
    filename = var.objects_list.path
    content = var.objects_list.age
}

output "object_age_output" {
    value = var.objects_list.age 
}

output "object_name_output" {
    value = var.objects_list.name[1] 
}