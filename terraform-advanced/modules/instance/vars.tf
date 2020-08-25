variable ami {
  default = "ami-02354e95b39ca8dec"
}

variable instance_type {
  default = "t2.micro"
}

variable key_name {
  default = "20954-quantiphi"
}

variable allocated_storage {
  default = 20
}

variable port {
  default = 3306
}

variable storage_type {
  default = "gp2"
}

variable engine {
  default = "mysql"
}

variable engine_version {
  default = "8.0"
}

variable instance_class {
  default = "db.t2.micro"
}
variable identifier {
  default = "rds-20954"
}
variable db_name {}

variable db_username {}

variable db_password {}

variable query {}

variable public_subnet_id {}

variable private_subnet2_id {} 

variable allow_db_id {} 

variable sngroup_id {} 

variable sg_pvt_id {}

variable sg_pub_id {} 