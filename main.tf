provider "aws" {
region = "us-east-2"

}

resource "aws_instance" "task" {
  ami             = "ami-0f58b397bc5c1f2e8"
  instance_type   = "t2.micro"

  tags = {
    Name = "task"
  }
}

resource "aws_security_group" "task_sg" {
  name        = "security group using terraform"
  description = "security group using terraform"
  vpc_id      = "vpc-03e0406a23108ac60"


  ingress {
    description      = "HTTPS"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
      Name = "task_sg"
  }
}

# user_data     = file("install-docker.sh")

