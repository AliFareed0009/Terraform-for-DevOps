# Map datatype - ( Also known as dictionaries in Python )

# In Map dataType we write in key=value pair
# Same DataType
variable "content_map" {
  type = map
  default = {
    "content1" = "this is content 1"
    "content2" = "this is content 2"
  }
}

# In List dataType we write in index
# Same DataType
variable "file_list" {
    type = list
    default  = ["/home/ali-fareed/Ali/DevOps/Terraform/terraform-dataType/file_list1.txt","/home/ali-fareed/Ali/DevOps/Terraform/terraform-dataType/file_list2.txt"]
}

# In Objects dataType we write in key=value with different dataTypes
variable "objects_list" {
    type = object({
      age = number
      path = string 
      name = list(string)
    })

    default = {
      age = 25
      path = "/home/ali-fareed/Ali/DevOps/Terraform/terraform-dataType/Ali.txt"
      name = ["Ali","Fareed"]
    }
}