output "vpc_id" {
	value = aws_vpc.vpc_resource.id
}

output "sngroup_id" {
  value = aws_db_subnet_group.sngroup.id 
}