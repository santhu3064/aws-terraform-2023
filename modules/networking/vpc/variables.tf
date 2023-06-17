
variable "cidr_block" {
    type = string
    description = "(Required) The CIDR block for the VPC."
}

variable "instance_tenancy" {
    type = string
    description = "Optional) A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. Using either of the other options (dedicated or host)"
    default = "default"
}


variable "tags" {
    type = map
    description = "(Optional) A map of tags to assign to the resource."
}
