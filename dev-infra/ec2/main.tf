data "aws_ami" "ubuntu_latest" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Type = "public"
    vpc  = "dev"
  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Type = "private"
    vpc  = "dev"
  }
}


resource "random_shuffle" "public_subnet" {
  input        = data.aws_subnets.public_subnets.ids
  result_count = 1
}

resource "random_shuffle" "private_subnet" {
  input        = data.aws_subnets.private_subnets.ids
  result_count = 1
}


resource "aws_security_group" "dev_infra_sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.dev_infra_sg.id
}

resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.dev_infra_sg.id
}


output "ami" {
  value = data.aws_ami.ubuntu_latest.id

}

output "sg" {
  value = aws_security_group.dev_infra_sg.id

}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu_latest.id
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  ebs_block_device {
    device_name = var.ebs_block_device_device_name
    encrypted   = var.ebs_block_device_encrypted
    volume_size = var.ebs_block_device_volume_size
    volume_type = var.ebs_block_device_volume_type
  }
  subnet_id              = data.aws_subnets.public_subnets.ids[0]
  vpc_security_group_ids = [aws_security_group.dev_infra_sg.id]
  key_name               = var.ec2_key_pair
  tags                   = var.ec2_tags
}

resource "aws_instance" "public_instances" {
  count = var.public_instance_count
  ami                         = data.aws_ami.ubuntu_latest.id
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  ebs_block_device {
    device_name = var.ebs_block_device_device_name
    encrypted   = var.ebs_block_device_encrypted
    volume_size = var.ebs_block_device_volume_size
    volume_type = var.ebs_block_device_volume_type
  }
  subnet_id              = data.aws_subnets.public_subnets.ids[0]
  vpc_security_group_ids = [aws_security_group.dev_infra_sg.id]
  key_name               = var.ec2_key_pair
  tags = "${merge(var.ec2_public_tags, {Name = "Public_instance_${count.index}"})}"
}


resource "aws_instance" "private_instances" {
  count = var.private_instance_count
  ami                         = data.aws_ami.ubuntu_latest.id
  instance_type               = var.instance_type
  ebs_block_device {
    device_name = var.ebs_block_device_device_name
    encrypted   = var.ebs_block_device_encrypted
    volume_size = var.ebs_block_device_volume_size
    volume_type = var.ebs_block_device_volume_type
  }
  subnet_id              = data.aws_subnets.private_subnets.ids[0]
  vpc_security_group_ids = [aws_security_group.dev_infra_sg.id]
  key_name               = var.ec2_key_pair
  tags = "${merge(var.ec2_public_tags, {Name = "private_instance_${count.index}"})}"
}


output "ec2_arn" {
  value = aws_instance.web.arn

}

output "ec2_public_arns" {
  value = aws_instance.public_instances[*].arn
}

output "ec2_private_arns" {
  value = aws_instance.private_instances[*].arn
}
