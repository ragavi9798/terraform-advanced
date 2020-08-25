resource "aws_subnet" "public_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.sn_cidr[0]
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone[0]
  tags = {
    Name = var.sn_names[0]
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id = var.vpc_id
  cidr_block = var.sn_cidr[1]
  map_public_ip_on_launch = "false"
  availability_zone = var.availability_zone[1] 
  tags = {
    Name = var.sn_names[1]
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id = var.vpc_id
  cidr_block = var.sn_cidr[2]
  map_public_ip_on_launch = "false"
  availability_zone = var.availability_zone[2]
  tags = {
    Name = var.sn_names[2]
  }
}