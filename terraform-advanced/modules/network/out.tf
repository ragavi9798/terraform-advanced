output "vpc_id" {
	value = aws_vpc.vpc_resource.id
}

output "public_subnet_id" {
	value = aws_subnet.public_subnet.id
}

output "private_subnet1_id" {
	value = aws_subnet.private_subnet1.id
}

output "private_subnet2_id" {
	value = aws_subnet.private_subnet2.id
}

output "sngroup_id" {
  value = aws_db_subnet_group.sngroup.id 
}