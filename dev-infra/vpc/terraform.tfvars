# Public subnet vars
public_subnet_one                         = "11.0.0.0/18"
public_subnet_one_az                      = "eu-west-2a"
public_subnet_one_map_public_ip_on_launch = true
public_subnet_one_tags = {
  Name = "dev_public_1"
}

public_subnet_two = "11.0.64.0/18"
public_subnet_two_az                      = "eu-west-2b"
public_subnet_two_map_public_ip_on_launch = true
public_subnet_two_tags = {
  Name = "dev_public_2"
}


private_subnet_one = "11.0.128.0/18"
private_subnet_one_az = "eu-west-2c"
private_subnet_one_tags = {
  Name = "dev_private_1"
}


private_subnet_two = "11.0.192.0/18"
private_subnet_two_az = "eu-west-2a"
private_subnet_two_tags = {
  Name = "dev_private_2"
}

public_route_tags = {
    Name = "dev_public_route"
    vpc = "dev"
}

private_route_tags = {
    Name = "dev_private_route"
    vpc = "dev"
}

public_subnet_common_tag = {
    Type = "public"
    vpc = "dev"

}
private_subnet_common_tag = {
    Type = "private"
    vpc = "dev"
}