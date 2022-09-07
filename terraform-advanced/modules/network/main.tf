locals {
  id = var.id
}

resource "aws_vpc" "vpc_resource" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${local.id}-vpc"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc_resource.id
  tags = {
    Name = "${local.id}-ig"
  }
}

resource "aws_eip" "eip" {
  vpc = true
  tags = {
      Name = "${local.id}-eip"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_resource.id
  cidr_block = var.sn_cidr[0]
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone[0]
  tags = {
    Name = var.sn_names[0]
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id = aws_vpc.vpc_resource.id
  cidr_block = var.sn_cidr[1]
  map_public_ip_on_launch = "false"
  availability_zone = var.availability_zone[1] 
  tags = {
    Name = var.sn_names[1]
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id = aws_vpc.vpc_resource.id
  cidr_block = var.sn_cidr[2]
  map_public_ip_on_launch = "false"
  availability_zone = var.availability_zone[2]
  tags = {
    Name = var.sn_names[2]
  }
}

resource "aws_nat_gateway" "my-nat-gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
      Name = "${local.id}-nat"
  }
  depends_on = [aws_eip.eip]
}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc_resource.id
   route {
    cidr_block = var.any_cidr
    gateway_id = aws_internet_gateway.gateway.id
  }
   tags = {
    Name = "${local.id}-rt-pub"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.vpc_resource.id
  route {
    nat_gateway_id = aws_nat_gateway.my-nat-gateway.id
    cidr_block     = var.any_cidr
  }
  tags = {
    Name = "${local.id}-rt-pvt"
  }
  depends_on = [aws_nat_gateway.my-nat-gateway]
}

resource "aws_route_table_association" "rt_association_pub" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "rt_association_pvt1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route.id
}

resource "aws_route_table_association" "rt_association_pvt2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route.id
}

resource "aws_db_subnet_group" "sngroup" {
  subnet_ids = [aws_subnet.private_subnet1.id,aws_subnet.private_subnet2.id]
  tags = {
    Name = "${local.id}-sngroup"
  }
}