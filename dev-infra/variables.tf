variable "public_subnet_one" {
    type = string
    description = "Subnet cidr range"
}

variable "public_subnet_one_az" {
    type = string
    description = "Subnet availabilty zone"
    default = "eu-west-2a"
}

variable "public_subnet_one_map_public_ip_on_launch" {
    type = bool
    description = "Subnet map public ip on launch"
}


variable "public_subnet_one_tags" {
    type = map
    description = "Subnet tags"
}


variable "public_subnet_two" {
    type = string
    description = "Subnet cidr range"
}

variable "public_subnet_two_az" {
    type = string
    description = "Subnet availabilty zone"
}

variable "public_subnet_two_map_public_ip_on_launch" {
    type = bool
    description = "Subnet map public ip on launch"
}


variable "public_subnet_two_tags" {
    type = map
    description = "Subnet tags"
}


variable "private_subnet_one" {
    type = string
    description = "Subnet cidr range"
}

variable "private_subnet_one_az" {
    type = string
    description = "Subnet availabilty zone"
}



variable "private_subnet_one_tags" {
    type = map
    description = "Subnet tags"
}


variable "private_subnet_two" {
    type = string
    description = "Subnet cidr range"
}

variable "private_subnet_two_az" {
    type = string
    description = "Subnet availabilty zone"
}


variable "private_subnet_two_tags" {
    type = map
    description = "Subnet tags"
}


variable "igw_route_cide" {
    type = string
    description = "Subnet tags"
    default = "0.0.0.0/0"
}

variable "public_route_tags" {
    type = map
    description = "Route tags"
}

variable "private_route_tags" {
    type = map
    description = "route tags"
}
