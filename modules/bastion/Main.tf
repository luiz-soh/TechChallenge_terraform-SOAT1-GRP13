## EC2 Bastion Host Security Group
resource "aws_security_group" "ec2-bastion-sg" {
  description = "EC2 Bastion Host Security Group"
  name        = "ec2-bastion-sg"
  vpc_id      = "${var.vpc_id}"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] ##correto ter apenas o ip de quem vai acessar
    description = "Open to Public Internet"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "IPv4 route Open to Public Internet"
  }
}

## EC2 Bastion Host Elastic IP
resource "aws_eip" "ec2-bastion-host-eip" {
  domain = "vpc"
  tags = {
    Name        = "elasticIp"
    Environment = "${var.environment}"
    Produto = "geral"
  }
}

## EC2 Bastion Host
resource "aws_instance" "ec2-bastion-host" {
  ami                         = "ami-09ac7e749b0a8d2a1"
  instance_type               = "t2.micro"
  key_name                    = "hub-dev"
  vpc_security_group_ids      = [aws_security_group.ec2-bastion-sg.id]
  subnet_id                   = "${var.public_subnet[0]}"
  associate_public_ip_address = false
  user_data                   = file("./scripts/bastion-bootstrap.sh")
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
    volume_type           = "gp2"
    encrypted             = true
    tags = {
      Name = "ec2-bastion-root-volume-${var.environment}"
      Produto = "geral"
    }
  }
  credit_specification {
    cpu_credits = "standard"
  }
  tags = {
    Name = "ec2-bastion-host-${var.environment}"
    Produto = "geral"
  }
  lifecycle {
    ignore_changes = [
      associate_public_ip_address,
    ]
  }
}

## EC2 Bastion Host Elastic IP Association
resource "aws_eip_association" "ec2-bastion-host-eip-association" {
  instance_id   = aws_instance.ec2-bastion-host.id
  allocation_id = aws_eip.ec2-bastion-host-eip.id
}
