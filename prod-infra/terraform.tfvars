prod_cidr_block =  "12.0.0.0/16"
prod_instance_tenancy = "default"
prod_vpc_tags = {
    Name = "prod_vpc"
}


public_subnet_cidr = "12.0.0.0/18"
public_subnet_az = "eu-west-2a"
map_public_ip_on_launch = true
public_subnet_tags = {
    Name = "prod_public_subnet"
    Type = "Public"
  }

private_subnet_cidr = "12.0.64.0/18"
private_subnet_az = "eu-west-2b"
map_public_ip_on_launch_privsubnet = false
private_subnet_tags = {
    Name = "prod_private_subnet"
    Type = "Private"
  }

igw_tags = {
  Name = "prod_vpc"
}


public_route_tags = {
      Name = "prod_public_route"
      Type = "Public"
}

private_route_tags = {
      Name = "prod_private_route"
      Type = "Private"
}