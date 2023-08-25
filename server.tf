terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-west-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0911e88fb4687e06b"
  instance_type = "t2.micro"
  key_name = "jayanth-import"

  tags = {
    Name = "Jayanth-DevOps-batch-server"
    env = "Production"
    owner = "Jayanth Krishnappa"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

