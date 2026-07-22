variable "vpc_id" {

  description = "ID da VPC"

  type = string
}


variable "route_tables" {

  description = "Route tables a serem criadas"

  type = map(object({

    routes = list(object({

      cidr_block  = string
      target_type = string
      target_id   = string

    }))

  }))

}


variable "tags" {

  description = "Tags comuns"

  type = map(string)

  default = {}

}