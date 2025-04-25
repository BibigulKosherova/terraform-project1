resource "aws_vpc" "group1" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

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

