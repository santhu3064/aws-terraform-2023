variable "sg_name" {
  type        = string
  description = "Security group name"
}

variable "sg_description" {
  type        = string
  description = "Security group description"
}

variable "instance_type" {
  type        = string
  description = "Instance type to create"
}


variable "associate_public_ip_address" {
  type        = bool
  description = "Assocaite public ip address"
}


variable "ebs_block_device_device_name" {
  type        = string
  description = "Name of the ebs volume"
}

variable "ebs_block_device_encrypted" {
  type        = bool
  description = "EBS encryption"
}

variable "ebs_block_device_volume_size" {
  type        = number
  description = "Subnet map public ip on launch"
}


variable "ebs_block_device_volume_type" {
  type        = string
  description = "Ec2 volume type"
}



variable "ec2_tags" {
  type        = map(any)
  description = "Ec2 tags"
}

variable "ec2_key_pair" {
  type        = string
  description = "Keypair of ec2"
}

variable "vpc_id" {
  type        = string
  description = "Id of the vpc"
}


variable "ec2_public_tags" {
  type        = map(any)
  description = "Ec2 tags"
}


variable "ec2_private_tags" {
  type        = map(any)
  description = "Ec2 tags"
}


variable "public_instance_count" {
  type        = number
  description = "Count of public instacnes"
}

variable "private_instance_count" {
  type        = number
  description = "Count of private instances"
}

