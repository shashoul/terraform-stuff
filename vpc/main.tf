provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "aws-clewmed-vpc-shady-test"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

#resource "aws_subnet" "subnet1" {
#  vpc_id            = aws_vpc.main.id
#  cidr_block        = var.subnet1_cidr
#  availability_zone = data.aws_availability_zones.available.names[0]
#
#  tags = {
#    Name = "aws-clewmed-subnet1-shady-test"
#  }
#}

resource "aws_subnet" "subnets" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "aws-clewmed-subnet-${count.index}-shady-test"
  }
}