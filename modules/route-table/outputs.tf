output "route_table_ids" {

  description = "IDs das route tables criadas"

  value = {
    for name, rt in aws_route_table.this :
    name => rt.id
  }

}