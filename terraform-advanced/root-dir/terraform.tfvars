sn_cidr=["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
availability_zone=["us-east-1a","us-east-1b","us-east-1c"] 
sn_names=["20954-sn-pub","20954-sn-pvt1","20954-sn-pvt2"]	
db_name = "db20954"
db_username = "ragavi_ceg"
db_password = "Ragavi98**"
query = "create table if not exists Persons (PersonID int,LastName varchar(255),FirstName varchar(255),Address varchar(255),City varchar(255));insert into Persons values (1,'Karthikeyan','Ragavi','Erode','TamilNadu');"