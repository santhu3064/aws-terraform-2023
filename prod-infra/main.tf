
locals {
    public_route_settings = [{
        cidr_block = "0.0.0.0/0"
        gateway_id = module.prod_igw.id
        }]
}

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

module "prod_igw" {
        source = "../modules/networking/igw"
        vpc_id = module.aws_prod_vpc.id
        tags = var.igw_tags
}



module "public_route" {
        source = "../modules/networking/routetable"
        vpc_id = module.aws_prod_vpc.id
        route_settings = local.public_route_settings
        tags = var.public_route_tags
}

module "private_route" {
        source = "../modules/networking/routetable"
        vpc_id = module.aws_prod_vpc.id
        route_settings = []
        tags = var.private_route_tags
}


module "public_route_assocation" {
        source = "../modules/networking/route_table_association"
        route_table_id = module.public_route.id
        subnet_id = module.prod_public_subnet.id
}

module "private_route_assocation" {
        source = "../modules/networking/route_table_association"
        route_table_id = module.private_route.id
        subnet_id = module.prod_priv_subnet.id
}
