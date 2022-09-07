locals {
  id = "12345"
}

resource "aws_instance" "instance_pub" {
  ami           = var.ami 
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id 
  vpc_security_group_ids = [var.sg_pub_id]
  key_name = var.key_name
  tags = {
    Name = "${local.id}-pub_instance"
  }
}


resource "aws_db_instance" "rds_ins" {
  allocated_storage    = var.allocated_storage
  port                 = var.port
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [var.allow_db_id]
  db_subnet_group_name = var.sngroup_id
  identifier          = var.identifier
  skip_final_snapshot = true
  tags = {
    Name = "${local.id}-rds"
  }
}

resource "aws_instance" "instance_pvt" {
    ami           = var.ami
    instance_type = var.instance_type
    subnet_id = var.private_subnet2_id
    vpc_security_group_ids = [var.sg_pvt_id]
    key_name = var.key_name
    user_data = <<EOF
                #!/bin/bash
                yum install mysql -y
                yum install telnet -y
                telnet "${aws_db_instance.rds_ins.address}" "${var.port}" > validate.txt
                if grep -q "Connected" validate.txt;then
                     mysql -h "${aws_db_instance.rds_ins.address}" -u "${var.db_username}" -p"${var.db_password}" -D "${var.db_name}" -e "${var.query}"
                fi   
    EOF     
    tags = {
        Name = "${local.id}-instance_private"
    }
    depends_on = [aws_db_instance.rds_ins]
}