resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.group1.id
  cidr_block              = var.subnet_cidr_blocks[0]
  availability_zone       = "${var.region}${var.availability_zones[0]}"
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.group1.id
  cidr_block              = var.subnet_cidr_blocks[1]
  availability_zone       = "${var.region}${var.availability_zones[1]}"
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.group1.id
  cidr_block              = var.subnet_cidr_blocks[2]
  availability_zone       = "${var.region}${var.availability_zones[2]}"
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "subnet3"
  }
}



resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.group1.id

  route {
    cidr_block = var.default_route_cidr
    gateway_id = aws_internet_gateway.project1_igw.id
  }

  tags = {
    Name = "project1"
  }
}

resource "aws_route_table_association" "subnet_assoc" {
  for_each = {
    subnet1 = aws_subnet.subnet1.id
    subnet2 = aws_subnet.subnet2.id
    subnet3 = aws_subnet.subnet3.id
  }

  subnet_id      = each.value
  route_table_id = aws_route_table.public-rt.id
}
