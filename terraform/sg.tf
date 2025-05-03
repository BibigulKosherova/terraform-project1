resource "aws_security_group" "allow_common_ports" {
  name        = "allow_common_ports"
  description = "Allow inbound traffic for common ports"
  vpc_id      = aws_vpc.group1.id

  ingress {
    description = "SSH from anywhere"
    from_port   = var.allowed_ports[0]
    to_port     = var.allowed_ports[0]
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]  # Use the variable for CIDR block
  }

  ingress {
    description = "Web traffic on port 8080"
    from_port   = var.allowed_ports[1]
    to_port     = var.allowed_ports[1]
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]  # Use the variable for CIDR block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_common_ports"
  }
}
