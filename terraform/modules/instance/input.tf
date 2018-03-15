variable "name" {
default = "webserver"
}

variable "region" {
default = "eu-west-2"
}

variable "instance_type" {
default = "t2.micro"
}

variable "keypair" {
default = "aws-home"
}

variable "vpc_security_group_ids" {
default = "basic-access"
}

#get the latest image
data "aws_ami" "debian" {
    most_recent = true

    filter {
      name   = "name"
      values = ["debian-stretch-hvm-x86_64-gp2-*"]
    }

    filter {
      name   = "virtualization-type"
      values = ["hvm"]

  }
}
