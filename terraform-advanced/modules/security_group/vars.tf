variable vpc_id {}

variable protocol {
  default = "tcp"
}

variable id {
  default = "12345"
}

variable any_cidr {
    default = ["0.0.0.0/0"]
}

variable sql_port {
    default = 3306
}

variable ssh_port {
    default = 22
}