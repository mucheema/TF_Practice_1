# Terraform support 3 types of variable
# String
# List
# Map


variable "ami" {
  type = "map"

  default = {
    us-east-1 = "ami-09d069a04349dc3cb"
    us-west-2 = "ami-01460aa81365561fe"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "instance_count" {
  default = "3"
}
variable "instance_tags" {
  type = "list"
  default = ["Terraform-1","Terraform-2","Terraform-3"]
} 