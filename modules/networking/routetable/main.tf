
resource "aws_route_table" "aws_route_table" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.route_settings
        content {
            cidr_block = try(route.value["cidr_block"],"")
            gateway_id = try(route.value["gateway_id"],"")
        }
  }
  tags = var.tags
}
