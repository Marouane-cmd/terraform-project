provider "aws" {
    region = "us-east-1"
    
}

resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
      Name: "development"
      vpc_env: "dev"
  }
}

resource "aws_subnet" "dev-sub" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
      Name: "subnet-1-dev"
    }
  }

  data "aws_vpc" "existing_vpc"{
    default = true
  }

  resource "aws_subnet" "dev-sub-2" {
  vpc_id     = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.96.0/20"
  availability_zone = "us-east-1a"
  tags = {
      Name: "subnet-1-default"
    }
  }