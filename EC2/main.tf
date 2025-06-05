provider "aws" {
  region = var.region
}

resource "aws_instance" "subraz_intern" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Subraz_EC2"
  }
}
