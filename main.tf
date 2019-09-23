variable "access_key" {}
variable "secret_key" {}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "eu-west-2"
}

data "aws_ami" "dev_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["packer-example*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["378228206711"]
}

resource "aws_instance" "dev_ec2" {
  ami           = "${data.aws_ami.dev_ami.id}"
  instance_type = "t2.micro"
  key_name = "dev-ec2"
  
tags = {
    Name = "dev machine"
  }

}



