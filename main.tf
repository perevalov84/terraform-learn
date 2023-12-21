variable "myvpc" {
    type = string
    default = "vpc-0248d513ad03aef14"
}
variable "subnet_cidr_block" {
    description = "subnet"
}

provider "aws" {
    region = "eu-north-1"
  
}
resource "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name: "development"
    }
}
resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone_id = "eun1-az1"
    tags = {
      Name: "subnet-1-dev"
    }
}
# data "aws_vpc" "existing_vpc" {
#     id = var.myvpc
# }
resource "aws_subnet" "dev-subnet-2" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "10.0.12.0/24"
    availability_zone_id = "eun1-az1"
    tags = {
      Name: "subnet-2-dev"
    }
}

output "dev-vpc-id" {
    value = aws_vpc.development-vpc.id
}
output "dev-subnet-id-1" {
    value = aws_subnet.dev-subnet-1.id
}


