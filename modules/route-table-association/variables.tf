variable "associations" {

  description = "Associação entre subnets e route tables"

  type = map(object({

    subnet_id      = string
    route_table_id = string

  }))

}