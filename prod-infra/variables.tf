
variable "prod_cidr_block" {
    type = string
    description = "(Required) The CIDR block for the VPC."
}

variable "prod_instance_tenancy" {
    type = string
    description = "Optional) A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. Using either of the other options (dedicated or host)"
}


variable "prod_vpc_tags" {
    type = map
    description = "(Optional) A map of tags to assign to the resource."
}



variable "public_subnet_cidr" {
    type = string
    description = "(Required) The CIDR block for the VPC."
}

variable "public_subnet_az" {
    type = string
}


variable "public_subnet_tags" {
    type = map
}

variable "map_public_ip_on_launch" {
    type = bool
}

variable "private_subnet_cidr" {
    type = string
    description = "(Required) The CIDR block for the VPC."
}

variable "private_subnet_az" {
    type = string
}


variable "private_subnet_tags" {
    type = map
}

variable "map_public_ip_on_launch_privsubnet" {
    type = bool
}



