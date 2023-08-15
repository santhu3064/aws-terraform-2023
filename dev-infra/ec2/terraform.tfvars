sg_name        = "dev_infra_sg"
sg_description = "dev infra security group"



instance_type = "t2.micro"




associate_public_ip_address = true




ebs_block_device_device_name = "/dev/sdc"

ebs_block_device_encrypted = "true"

ebs_block_device_volume_size = "30"
ebs_block_device_volume_type = "gp2"

ec2_tags = {
  Name = "dev_infra_ec2_one"
}

ec2_key_pair = "dev-infra"


vpc_id = "vpc-0aa7b8c59ac1c05ce"

ec2_public_tags = {
  Type = "public"
}

ec2_private_tags = {
  Type = "private"
}

public_instance_count = 4

private_instance_count = 10