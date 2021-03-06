module "vpc" {
	source = "../modules/network"
  public_subnet_id = module.subnet.public_subnet_id
  private_subnet1_id = module.subnet.private_subnet1_id
  private_subnet2_id = module.subnet.private_subnet2_id
}

module "subnet" {
  source = "../modules/subnet"
  vpc_id = module.vpc.vpc_id
  sn_cidr= var.sn_cidr
	availability_zone = var.availability_zone
	sn_names = var.sn_names
} 

module "sg" {
	source = "../modules/security_group"
	vpc_id = module.vpc.vpc_id
}

module "instance" {
  source = "../modules/instance"
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  query = var.query
  public_subnet_id = module.subnet.public_subnet_id
  private_subnet2_id = module.subnet.private_subnet2_id
  sngroup_id = module.vpc.sngroup_id
  allow_db_id = module.sg.allow_db_id
  sg_pvt_id = module.sg.sg_pvt_id
  sg_pub_id = module.sg.sg_pub_id
}