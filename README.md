# terraform-modules
Terraform modules to automate cloud infrastructure

# AWS
| Module Name |
|-------------|
| vpc         |
| ec2         |


Comment the lifecycle block in main.tf file to reflect the chages for desired size. This is used for to prevent Terraform from scaling down ASG behind AWS EKS Managed Node Group. lifecycle { create_before_destroy = true ignore_changes = [ scaling_config[0].desired_size, ] }

# Steps to execute


To authenticate the aws and provision infra in terraform using mfa execute the aws_mfa_auth.py and provide the mfa token of the user who has the force_mfa policy attached and that user access key id and access key should be present in ~/.aws/credentials file in the server the user is executing a command. This should create a new profile mfa in ~/.aws/credentials


change directory to the folder where you want to execute code 
example: cd bayers/ec2

# to install all the providers
terraform init

# to check the changes that are going to be implemented
terraform plan

# to apply the changes
terraform apply

# to destroy the resource created by terraform
terraform destroy -target RESOURCE_TYPE.NAME -target RESOURCE_TYPE2.NAME 

Below are few other userful commands from Terraform

terraform taint 
terraform taint 'module.application-ec2["0"].aws_instance.main' 
terraform refresh 


# To know the Terraform states 
terraform state list 

# to know the terraform logs

Terraform Logs 

export TF_LOG=TRACE 

export TF_LOG_PATH="terraform.log" 