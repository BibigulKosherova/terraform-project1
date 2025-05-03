provider "aws" {
  region = var.region
}

resource "aws_vpc" "group1" {
  cidr_block           = var.vpc_config.cidr_block
  enable_dns_support   = var.vpc_config.enable_dns_support
  enable_dns_hostnames = var.vpc_config.enable_dns_hostnames

  tags = {
    Name = "group1"
  }
}

resource "aws_internet_gateway" "project1_igw" {
  vpc_id = aws_vpc.group1.id

  tags = {
    Name = "project1_igw"
  }
}

