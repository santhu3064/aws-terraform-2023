

variable "vpc_id" {
    type = string
    description = "(Required) The ID of the VPC."
}

variable "route_settings" {
    type =  list(map(any))
    description = "Map of route settings"
}


variable "tags" {
    type = map
    description = "(Optional) A map of tags to assign to the resource."
}

