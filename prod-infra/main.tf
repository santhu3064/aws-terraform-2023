module "aws_prod_vpc" {
    source = "../modules/networking/vpc"
    cidr_block = var.prod_cidr_block
    instance_tenancy = var.prod_instance_tenancy
    tags =  var.prod_vpc_tags

}


module "prod_public_subnet" {
    source = "../modules/networking/subnet"
    vpc_id = module.aws_prod_vpc.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.public_subnet_az
    map_public_ip_on_launch = var.map_public_ip_on_launch
    tags = var.public_subnet_tags

}


module "prod_priv_subnet" {
    source = "../modules/networking/subnet"
    vpc_id = module.aws_prod_vpc.id
    cidr_block = var.private_subnet_cidr
    availability_zone = var.private_subnet_az
    map_public_ip_on_launch = var.map_public_ip_on_launch_privsubnet
    tags = var.private_subnet_tags

}
