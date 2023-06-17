

variable "cidr_block" {
    type = string
    description = "(Required) The CIDR block for the subnet."
}

variable "availability_zone" {
    type = string
    description = "Optional) A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. Using either of the other options (dedicated or host)"
    default = "default"
}


variable "vpc_id" {
    type = string
    description = "(Required) The vpc to create subnet."
}

variable "map_public_ip_on_launch" {
    type = bool
    description = "Boolean var to map public ip on launch."
}


variable "tags" {
    type = map
    description = "(Optional) A map of tags to assign to the resource."
}
