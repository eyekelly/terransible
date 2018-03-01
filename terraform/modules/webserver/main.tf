provider "aws" {
  region = "us-east-1"
}

variable "server_port" {
  description = "port for http requests"
  default = 8080
}

resource "aws_launch_configuration" "UaR_02_1_LC" {
  image_id        = "ami-40d28157"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.instances.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "instance_ASG" {
 launch_configuration   = "${aws_launch_configuration.UaR_02_1_LC.id}"
 availability_zones     = ["${data.aws_availability_zones.all.names}"]

load_balancers = ["${aws_elb.UaR_02_1_ELB.name}"]
health_check_type = "ELB"

 min_size = 2
 max_size = 10

 tag {
   key                  = "Name"
   value                = "terraform_asg_example"
   propagate_at_launch  = true
 }
}

resource "aws_security_group" "instances" {
  name = "terraform-example-instance"

  ingress {
    from_port     = "${var.server_port}"
    to_port       = "${var.server_port}"
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_availability_zones" "all" {}

resource "aws_elb" "UaR_02_1_ELB" {
  name                = "terraform-asg-example"
  availability_zones  = ["${data.aws_availability_zones.all.names}"]
  security_groups     = ["${aws_security_group.elb.id}"]

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "${var.server_port}"
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:${var.server_port}/"
  }
}

resource "aws_security_group" "elb" {
  name = "terraform_example_elb"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
