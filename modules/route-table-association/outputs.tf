output "association_ids" {

  description = "IDs das associações criadas"

  value = {
    for name, association in aws_route_table_association.this :
    name => association.id
  }

}