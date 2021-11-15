terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "vpc0" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "example-vpc"
  }
}

# Create a CIDR block
variable "common_cidr_block" {
  type = string
  default = "10.0.30.0/24"
}

# Create a Subnet
resource "aws_subnet" "subnet0" {
  vpc_id     = aws_vpc.vpc0.id
  cidr_block = var.common_cidr_block

  tags = {
    Name = "example-subnet"
  }
}

# Create an Output Variable
output "subnet0_id" {
  value = aws_subnet.subnet0.vpc_id
}