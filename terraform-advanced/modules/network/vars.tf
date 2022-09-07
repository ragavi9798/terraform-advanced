variable id {
    default = "12345"
}

variable vpc_cidr {
    default = "10.0.0.0/16"
}

variable any_cidr {
    default = "0.0.0.0/0"
}

variable sn_cidr {
    type = list (string)
}

variable availability_zone {
    type = list (string)
}

variable sn_names {
    type = list (string)
}