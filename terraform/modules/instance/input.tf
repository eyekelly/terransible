variable "name" {
default = "single_instance"
}

variable "region" {
default = "eu-west-2"
}

variable "instance_type" {
default = "t2.micro"
}

variable "keypair" {
default = "terraform_ansible"
}

variable "vpc_security_group_ids" {
default = "basic-access-sg"
}

#get the latest centos
data "aws_ami" "centos" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}
