locals {
  id = var.id
}

resource "aws_security_group" "sg_pub" {
  name = "${local.id}-sg_instance_pub"
  vpc_id = var.vpc_id
  ingress {
    from_port = var.ssh_port
		to_port = var.ssh_port
		protocol = var.protocol
		cidr_blocks = var.any_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.any_cidr
  }
  tags = {
    Name = "${local.id}-sg_instance_pub"
  }
}

resource "aws_security_group" "sg_pvt" {
  name = "${local.id}-sg_instance_pvt"
  vpc_id = var.vpc_id
  ingress {
    from_port = var.ssh_port
		to_port = var.ssh_port
		protocol = var.protocol
		security_groups = [aws_security_group.sg_pub.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.any_cidr
  }
  tags = {
    Name = "${local.id}-sg_instance_pvt"
  }
}

resource "aws_security_group" "allow-db" {
	vpc_id = var.vpc_id
	name = "${local.id}-sg_db_allow"
	ingress {
		from_port = var.sql_port
		to_port = var.sql_port
		protocol = var.protocol
		security_groups = [aws_security_group.sg_pvt.id]
	}
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = var.any_cidr
	}
	tags = {
	    Name = "${local.id}-sg_db_allow"
	}
}