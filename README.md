# Terraform-for-DevOps

## Introduction
Infrastructure as code (IaC) tools allow you to manage infrastructure with
configuration files rather than through a graphical user interface. IaC allows
you to build, change, and manage your infrastructure in a safe, consistent,
and repeatable way by defining resource configurations you can version, reuse,
and share.

## Files and there Commands

#### 

| Folder Name | Commands Use     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Mini-Project` | `AWS ` | Creating AWS ec2 instance  |
| `Mega-Project` | `MS Azure` | Creating MS Azure Virtual Machine  |
| `terraform-backend` | `Intilize Backend` | Intilize Backend for state File |
| `terraform-dataType` | `dataType` | Exploring dataType in Terraform |
| `terraform_dockerfile_install.txt` | `Docker` | Installing docker and Nginx with Terraform |
| `terraform-local.txt` | `Local` | Creating Local Files with Terraform |
| `terraform-modules` | `Modules` |  Using Terraform with modules |
| `terraform-variables` | `Variables` | Using Variables in Terraform |


## Challenges in IT Infrastructure

![Challenges in IT Infrastructure](https://github.com/AliFareed0009/Terraform-for-DevOps/blob/53a8e0e8db39e59cfe905c58a75a99fbcbb78ee8/Images/Challenges%20in%20IT%20Infrastructure.png)


## What is Terraform
-   Terraform is HashiCorp's infrastructure as a code tool. It lets you define resources and infrastructure in human-readable, declarative configuration files and manages your infrastructure's lifecycle. Using Terraform has several advantages over manually managing your infrastructure
-   Terraform can manage infrastructure on multiple cloud platforms.
-   The human-readable configuration language helps you write infrastructure
code quickly.

## Terraform Architecture
![Terraform Architecture](https://github.com/AliFareed0009/Terraform-for-DevOps/blob/a7b2d8b8e1132320a3cd9967d1f49ea830514938/Images/Terraform%20Architecture.png)

## Installation of Terrform
1.  Ensure that your system is up to date and you have installed the gnupg, software-properties-common, and curl packages installed. You will use these packages to verify HashiCorp's GPG signature and install HashiCorp's Debian package repository.

        sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

2.  Install the HashiCorp GPG Key

        wget -O- https://apt.releases.hashicorp.com/gpg | \
        gpg --dearmor | \
        sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

3.  Verify the key's fingerprint

        gpg --no-default-keyring \
        --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
        --fingerprint

4.  The gpg command will report the key fingerprint:

        /usr/share/keyrings/hashicorp-archive-keyring.gpg
        -------------------------------------------------
        pub   rsa4096 XXXX-XX-XX [SC]
        AAAA AAAA AAAA AAAA
        uid           [ unknown] HashiCorp Security (HashiCorp Package Signing) <security+packaging@hashicorp.com>
        sub   rsa4096 XXXX-XX-XX [E]

5.  Add the official HashiCorp repository to your system. The lsb_release -cs command finds the distribution release codename for your current system, such as buster, groovy, or sid.

        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
        https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
        sudo tee /etc/apt/sources.list.d/hashicorp.list

6.  Download the package information from HashiCorp.
        
        sudo apt update

7.  Install Terraform from the new repository.
        
        sudo apt-get install terraform

8.  Verify the installation

        terraform -help

9.  f you use either Bash or Zsh, you can enable tab completion for Terraform commands. To enable autocomplete, first ensure that a config file exists for your chosen shell.

        touch ~/.bashrc

10. Then install the autocomplete package.

        terraform -install-autocomplete

Once the autocomplete support is installed, you will need to restart your shell.

## Blocks and Arguments
-   A block is a container for other content and An argument assigns a value to a particular name:
-   filename = "/home/ubuntu/abc123.txt"
-   The identifier before the equals sign is the argument name, and the expression after the equals sign is the argument's value.

### Resource block: 
-   Block name used to mention the type of the block. The
resource block expects two labels, which are local_file and “pet” in the
example above. A particular block type may have any number of required
labels, or it may require none.

        resource “local_file" “pet” {
            filename = “root/pets.txt”
            Argument2= ”We love Pets!”
        }

        resource “<provider>_<resource type> “<resource name>” {
            Argument1 = “”
            Argument2=  ””
        }

-   Local = provider, file = type, “pet” name of the resource.
-   Then we have arguments, filename, content, etc
-   We can have multiple resources

## Execution of Infrastructure
### Terraform init
-   This command will scan your tf files in that folder and install all the required
automation things.

### Terraform plan
-   This command will create an execution plan for terraforming, the things
that will be installed, the names, and the properties added.

### Terraform apply
-   The actual execution and automation happen in this command.

## Terraform Variables
-   We can create a variables.tf file which will hold all the variables.

        variable "filename" {
            default = "/home/ubuntu/terrform-tutorials/terraform-variables/demo-
            var.txt"
        }

        variable "content" {
            default = "This is coming from a variable which was updated"
        }

        These variables can be accessed by var object in main.tf
        resource "local_file" "devops" {
            filename = var.filename
            content = var.content
        }

### Input Variables

-   Input variables are used to parameterize your Terraform configurations. They allow you to pass values into your modules or configurations from the outside. Input variables can be defined within a module or at the root level of your configuration. Here's how you define an input variable:

```hcl
variable "example_var" {
  description = "An example input variable"
  type        = string
  default     = "default_value"
}
```

In this example:

- `variable` is used to declare an input variable named `example_var`.
- `description` provides a human-readable description of the variable.
- `type` specifies the data type of the variable (e.g., `string`, `number`, `list`, `map`, etc.).
- `default` provides a default value for the variable, which is optional.

You can then use the input variable within your module or configuration like this:

```hcl
resource "example_resource" "example" {
  name = var.example_var
  # other resource configurations
}
```

You reference the input variable using `var.example_var`.

## Output Variables

Output variables allow you to expose values from your module or configuration, making them available for use in other parts of your Terraform setup. Here's how you define an output variable:

```hcl
output "example_output" {
  description = "An example output variable"
  value       = resource.example_resource.example.id
}
```

In this example:

- `output` is used to declare an output variable named `example_output`.
- `description` provides a description of the output variable.
- `value` specifies the value that you want to expose as an output variable. This value can be a resource attribute, a computed value, or any other expression.

You can reference output variables in the root module or in other modules by using the syntax `module.module_name.output_name`, where `module_name` is the name of the module containing the output variable.

For example, if you have an output variable named `example_output` in a module called `example_module`, you can access it in the root module like this:

```hcl
output "root_output" {
  value = module.example_module.example_output
}
```

This allows you to share data and values between different parts of your Terraform configuration and create more modular and maintainable infrastructure-as-code setups.

## Data Types in Terraform

        variable "file_contents" {
        type = map
            default = {
                "statement1" = "this is cool"
                "statement2" = "this is cooler"
            }
        }

## Providers

-   The provider block configures the specified provider, in this case, docker.
-   A provider is a plugin that Terraform uses to create and manage your
resources.
        
        terraform {
            required_providers {
                aws = {
                    source = "hashicorp/aws"
                    version = "~> 3.79"
                }
            }
        }

### Multiple Region Implementation in Terraform

You can make use of `alias` keyword to implement multi region infrastructure setup in
terraform.

        ```
        provider "aws" {
            alias = "us-east-1"
            region = "us-east-1"
            }

        provider "aws" {
            alias = "us-west-2"
            region = "us-west-2"
        }

        resource "aws_instance" "example" {
            ami = "ami-0123456789abcdef0"
            instance_type = "t2.micro"
            provider = "aws.us-east-1"
        }

        resource "aws_instance" "example2" {
            ami = "ami-0123456789abcdef0"
            instance_type = "t2.micro"
            provider = "aws.us-west-2"
        }
        ```

## Terraform State

![Terraform State](https://github.com/AliFareed0009/Terraform-for-DevOps/blob/a7b2d8b8e1132320a3cd9967d1f49ea830514938/Images/terraform%20State.jpg)

-   Whenever we do terraform init, the plugins are installed
-   Whenever we do a terraform plan, the execution plan is generated
-   Whenever we do terraform apply, the execution is done and state is
maintained.
-   If we don’t have state we can still run the above commands, but state
is useful to keep a record of why and how infrastructure was created at
the first place.
-   State is like a blueprint of the Real-world Infrastructure with some
unique IDs and attributes.

## Terraform with AWS

-   Provisioning on AWS is quite easy and straightforward with Terraform.

### Prerequisites

1.  AWS CLI
-   The AWS Command Line Interface (AWS CLI) is a unified tool to manage
your AWS services. With just one tool to download and configure, you can
control multiple AWS services from the command line and automate them
through scripts.

2.  AWS IAM user
-   In order to connect your AWS account and Terraform, you need the access
keys and secret access keys exported to your machine.

-   To interact with AWS programmatically, you should create an IAM (Identity and Access Management) user with appropriate permissions. Here's how to create one:

a. Log in to the AWS Management Console with an account that has administrative privileges.

b. Navigate to the IAM service.

c. Click on "Users" in the left navigation pane and then click "Add user."

- Choose a username, select "Programmatic access" as the access type, and click "Next: Permissions."

- Attach policies to this user based on your requirements. At a minimum, you should attach the "AmazonEC2FullAccess" policy for basic EC2 operations. If you need access to other AWS services, attach the relevant policies accordingly.

- Review the user's configuration and create the user. Be sure to save the Access Key ID and Secret Access Key that are displayed after user creation; you'll need these for Terraform.

        export AWS_ACCESS_KEY_ID=<access key>
        export AWS_SECRET_ACCESS_KEY=<secret access key>

3.  Install required providers

        terraform {
            required_providers {
                aws = {
            source = "hashicorp/aws"
            version = "~> 4.16"
                }
            }   
            required_version = ">= 1.2.0"
        }

        Add the region where you want your instances to be
            provider "aws" {
                region = "us-east-1"
        }

## Terraform State commands
1.  terraform state list: List resources within terraform state.
2.  terraform-state mv : Move items within terraform state. This will be used to resource renaming without destroy, apply command.
3.  terraform state pull: Manually download and output the state from the state file.
4.  terraform state push: Manually upload a local state file to the remote state.
5.  terraform state rm: Remove items from the state. Items removed from the state are not physically destroyed. This item no longer managed by
terraform.
6.  terraform state show: Show attributes of a single resource in the state.


## States

-   Terraform uses state to keep track of the infrastructure it manages. To
use Terraform effectively, you must keep your state accurate and secure.
State is a necessary requirement for Terraform to function. It is often
asked if it is possible for Terraform to work without state, or for
-   Terraform to not use state and just inspect cloud resources on every run.
-   Terraform requires some sort of database to map Terraform config to the
real world. Alongside the mappings between resources and remote objects,
terraform must also track metadata such as resource dependencies. Terraform stores a cache of the attribute values for all resources in the
state. This is done to improve performance.

### Sensitive Data
-   Terraform state can contain sensitive data, e.g. database password, etc.
When using a remote state, the state is only ever held in memory when
used by Terraform.
-   The S3 backend supports encryption at rest when the encrypt option is
enabled. IAM policies and logging can be used to identify any invalid
access. Requests for the state go over a TLS connection.

## Modules
-   A module is a simple directory that contains other .tf files. Using
modules we can make the code reusable. Modules are local or remote.

### Calling Child Module
-   Input variables to accept values from the calling module. Output values
to return results to the calling module, which it can then use to populate
arguments elsewhere. Resources to define one or more infrastructure
objects that the module will manage.

        variable "image_id" {
            type = string
        }
        resource "aws_instance" "myec2" {
            ami = var.image_id
            instance_type = "t2.micro"
        }
        output "instance_ip_addr" {
            value = aws_instance.myec2.private_ip
        }
        module "dbserver" {
            source = "./db"
            image_id = "ami-0528a5175983e7f28"
        }

### module output
-   Module outputs are very similar to module inputs, an example in a

        output "privateip" {
            value = aws_instance.myec2.private_ip
        }   

## Count and Count Index
-   The count parameter on resources can simplify configurations and let you
scale resources by simply incrementing a number.
-   In resource blocks where the count is set, an additional count object
(count.index) is available in expressions, so that you can modify the
configuration of each instance.    

        resource "aws_instance" "myec2" {
            ami = var.image_id
            instance_type = "t2.micro"
            count = 3
        }
        output "instance_ip_addr" {
            value = aws_instance.myec2[*].private_ip
        }

## Meta-Arguments in Terraform

1.  Count
2.  for_each

### Count
        terraform {
            required_providers {
                aws = {
                source = "hashicorp/aws"
                version = "~> 4.16"
                }
            }
            required_version = ">= 1.2.0"
        }
        
        provider "aws" {
            region = "us-east-1"
        }
        resource "aws_instance" "server" {
        count = 4

        ami= "ami-08c40ec9ead489470"
        instance_type = "t2.micro"
            tags = {
                Name = "Server ${count.index}"
            }
        }

### for_each

        terraform {
            required_providers {
                    aws = {
                    source = "hashicorp/aws"
                    version = "~> 4.16"
                    }
            }
            required_version = ">= 1.2.0"
        }

        provider "aws" {
            region = "us-east-1"
        }

        locals {
            ami_ids = toset([
                "ami-0b0dcb5067f052a63",
                "ami-08c40ec9ead489470",
            ])
        }
        
        resource "aws_instance" "server" {
            for_each = local.ami_ids
            ami= each.key
            instance_type = "t2.micro"
            tags = {
                Name = "Server ${each.key}"
            }
        }

## Conditional Expressions

-   Conditional expressions in Terraform are used to define conditional logic within your configurations. They allow you to make decisions or set values based on conditions. Conditional expressions are typically used to control whether resources are created or configured based on the evaluation of a condition.

The syntax for a conditional expression in Terraform is:

```hcl
condition ? true_val : false_val
```

- `condition` is an expression that evaluates to either `true` or `false`.
- `true_val` is the value that is returned if the condition is `true`.
- `false_val` is the value that is returned if the condition is `false`.

Here are some common use cases and examples of how to use conditional expressions in Terraform:

## Conditional Resource Creation Example

```hcl
resource "aws_instance" "example" {
  count = var.create_instance ? 1 : 0

  ami           = "ami-XXXXXXXXXXXXXXXXX"
  instance_type = "t2.micro"
}
```

-   In this example, the `count` attribute of the `aws_instance` resource uses a conditional expression. If the `create_instance` variable is `true`, it creates one EC2 instance. If `create_instance` is `false`, it creates zero instances, effectively skipping resource creation.

# Conditional Variable Assignment Example

```hcl
variable "environment" {
  description = "Environment type"
  type        = string
  default     = "development"
}

variable "production_subnet_cidr" {
  description = "CIDR block for production subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "development_subnet_cidr" {
  description = "CIDR block for development subnet"
  type        = string
  default     = "10.0.2.0/24"
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Example security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.environment == "production" ? [var.production_subnet_cidr] : [var.development_subnet_cidr]
  }
}

```

-   In this example, the `locals` block uses a conditional expression to assign a value to the `subnet_cidr` local variable based on the value of the `environment` variable. If `environment` is set to `"production"`, it uses the `production_subnet_cidr` variable; otherwise, it uses the `development_subnet_cidr` variable.

## Conditional Resource Configuration 

```hcl
resource "aws_security_group" "example" {
  name = "example-sg"
  description = "Example security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.enable_ssh ? ["0.0.0.0/0"] : []
  }
}
```

-   In this example, the `ingress` block within the `aws_security_group` resource uses a conditional expression to control whether SSH access is allowed. If `enable_ssh` is `true`, it allows SSH traffic from any source (`"0.0.0.0/0"`); otherwise, it allows no inbound traffic.

-   Conditional expressions in Terraform provide a powerful way to make decisions and customize your infrastructure deployments based on various conditions and variables. They enhance the flexibility and reusability of your Terraform configurations.

