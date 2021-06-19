terraform {
  required_version = ">= 0.12"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

provider "aws" {
  region = var.AWS_REGION
}


# Creating VPC,name, CIDR and Tags
resource "aws_vpc" "liveProject" {
  cidr_block           = "172.16.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "liveProject"
  }
}


# Creating Public Subnets in VPC
resource "aws_subnet" "publicA" {
  vpc_id                  = aws_vpc.liveProject.id
  cidr_block              = "172.16.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "publicA"
  }
}



resource "aws_subnet" "publicB" {
  vpc_id                  = aws_vpc.liveProject.id
  cidr_block              = "172.16.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "publicB"
  }
}

resource "aws_subnet" "publicC" {
  vpc_id                  = aws_vpc.liveProject.id
  cidr_block              = "172.16.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "publicC"
  }
}



#creating private subnets

resource "aws_subnet" "AppA" {
  vpc_id                  = aws_vpc.liveProject.id
  cidr_block              = "172.16.4.0/24"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "AppA"
  }
}

resource "aws_subnet" "AppB" {
  vpc_id                  = aws_vpc.liveProject.id
  cidr_block              = "172.16.5.0/24"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "AppB"
  }
}

resource "aws_subnet" "AppC" {
  vpc_id                  = aws_vpc.liveProject.id
  cidr_block              = "172.16.6.0/24"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "AppC"
  }
}


#DB subnets:
resource "aws_subnet" "DbA" {
  vpc_id                  = aws_vpc.liveProject.id
  cidr_block              = "172.16.8.0/24"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "DbA"
  }
}

resource "aws_subnet" "DbB" {
  vpc_id                  = aws_vpc.liveProject.id
  cidr_block              = "172.16.9.0/24"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "DbB"
  }
}


resource "aws_subnet" "DbC" {
  vpc_id                  = aws_vpc.liveProject.id
  cidr_block              = "172.16.10.0/24"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "DbC"
  }
}


output "vpc_id" {
  value =  aws_vpc.liveProject.id 
}


