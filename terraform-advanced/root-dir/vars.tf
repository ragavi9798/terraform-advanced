variable region {
    default ="us-east-1"
}

variable sn_cidr {
    type = list(string)
}

variable availability_zone {
    type = list(string)
}

variable sn_names {
    type = list(string)
}

variable db_name {}

variable db_username {}

variable db_password {}

variable query {}