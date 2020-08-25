output "sg_pub_id" {
	value = aws_security_group.sg_pub.id
}

output "sg_pvt_id" {
	value = aws_security_group.sg_pvt.id
}

output "allow_db_id" {
	value = aws_security_group.allow-db.id
}