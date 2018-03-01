provider "aws" {
region = "${var.region}"
}

resource "aws_instance" "instance" {
ami			= "${data.aws_ami.debian.id}"
instance_type 		= "${var.instance_type}"
key_name		= "${var.keypair}"
security_groups		= ["${var.vpc_security_group_ids}"]

tags {
Name = "${var.name}"
}
}
