resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.group1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project1_igw.id
  }
  tags = {
    Name = "project1"
  }
}

resource "aws_route_table_association" "subnet1_assoc" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "subnet2_assoc" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "subnet3_assoc" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.public-rt.id
}