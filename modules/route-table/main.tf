resource "aws_route_table" "this" {

  for_each = var.route_tables

  vpc_id = var.vpc_id


  dynamic "route" {

    for_each = each.value.routes

    content {

      cidr_block = route.value.cidr_block


      gateway_id = route.value.target_type == "internet_gateway" ? route.value.target_id : null

      nat_gateway_id = route.value.target_type == "nat_gateway" ? route.value.target_id : null

    }
  }


  tags = merge(
    var.tags,
    {
      Name = each.key
    }
  )
}