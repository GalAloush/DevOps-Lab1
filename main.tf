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
  region = "us-west-2"
}

# Create a VPC
resource "aws_vpc" "galosh" {   //vpc=virtual private cloud
  cidr_block = "198.168.5.0/24" //subnet=192.168.5
  tags = {
    "name" = "vpc1-Gal"
  }
}


################### subnet web ###################
resource "aws_subnet" "subnet_web" {
  vpc_id     = aws_vpc.galosh.id
  cidr_block = "198.168.5.0/27" //2^5 = 32, 

  tags = {
    "name" = "subnet_web"
  }
}
################### subnet app ###################
resource "aws_subnet" "subnet_app" {
  vpc_id     = aws_vpc.galosh.id
  cidr_block = "198.168.5.32/27"

  tags = {
    "name" = "subnet_app"
  }
}

################### subnet db ###################
resource "aws_subnet" "subnet_db" {
  vpc_id     = aws_vpc.galosh.id
  cidr_block = "198.168.5.64/28"

  tags = {
    "name" = "subnet_db"
  }
}
