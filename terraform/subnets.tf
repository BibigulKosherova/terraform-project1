resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.group1.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.group1.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.group1.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet3"
  }
}