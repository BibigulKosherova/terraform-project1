data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



resource "aws_instance" "group1" {
  ami                    = data.aws_ami.amazon.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.allow_common_ports.id]
  key_name               = aws_key_pair.deployer.key_name

  tags = {
    Name = "group1"
  }
}

output ec2 {
    value = aws_instance.group1.public_ip
}

resource "null_resource" "wait_for_instance" {
  depends_on = [aws_instance.group1]

  provisioner "local-exec" {
    command = "echo 'Waiting for EC2 to boot...' && sleep 60"
  }
}

resource "null_resource" "ansible_provisioner" {
  depends_on = [null_resource.wait_for_instance]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${aws_instance.group1.public_ip}, ../ansible/main.yml --user ec2-user --private-key ~/.ssh/id_rsa"
  }
}



