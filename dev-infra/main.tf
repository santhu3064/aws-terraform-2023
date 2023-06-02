locals {
  cidr_block = "11.0.0.0/16"
  tags = {
    Name = "dev"
  }
}

resource "aws_vpc" "main" {

  cidr_block = local.cidr_block
  tags       = local.tags
}


resource "aws_subnet" "public_subnet_one" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_one
  availability_zone       = var.public_subnet_one_az
  map_public_ip_on_launch = var.public_subnet_one_map_public_ip_on_launch

  tags = var.public_subnet_one_tags
}

resource "aws_subnet" "public_subnet_two" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_two
  availability_zone       = var.public_subnet_two_az
  map_public_ip_on_launch = var.public_subnet_two_map_public_ip_on_launch

  tags = var.public_subnet_two_tags
}

resource "aws_subnet" "private_subnet_one" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_one
  availability_zone = var.private_subnet_one_az

  tags = var.private_subnet_one_tags
}

resource "aws_subnet" "private_subnet_two" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_two
  availability_zone = var.private_subnet_two_az

  tags = var.private_subnet_two_tags
}

resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.main.id

  tags = local.tags
}

resource "aws_route_table" "dev_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.igw_route_cide
    gateway_id = aws_internet_gateway.dev_igw.id
  }

  tags = var.public_route_tags
}

resource "aws_route_table_association" "dev_public_one" {
  subnet_id      = aws_subnet.public_subnet_one.id
  route_table_id = aws_route_table.dev_route_table.id
}


resource "aws_route_table_association" "dev_public_two" {
  subnet_id      = aws_subnet.public_subnet_two.id
  route_table_id = aws_route_table.dev_route_table.id
}


resource "aws_route_table" "dev_private_route_table" {
  vpc_id = aws_vpc.main.id

  tags = var.private_route_tags
}

resource "aws_route_table_association" "dev_private_one" {
  subnet_id      = aws_subnet.private_subnet_one.id
  route_table_id = aws_route_table.dev_private_route_table.id
}


resource "aws_route_table_association" "dev_private_two" {
  subnet_id      = aws_subnet.private_subnet_two.id
  route_table_id = aws_route_table.dev_private_route_table.id
}

