variable "name" {
  description = "Nome do DB Subnet Group"
  type        = string
}


variable "subnet_ids" {
  description = "Lista de IDs das subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags do recurso"
  type        = map(string)
}