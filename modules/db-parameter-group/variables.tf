variable "name" {
  description = "Nome do parameter group"
  type        = string
}

variable "family" {
  description = "Família do engine PostgreSQL"
  type        = string
}

variable "parameters" {
  description = "Lista de parâmetros do banco"
  type = list(object({
    name  = string
    value = string
  }))
}

variable "tags" {
  description = "Tags do recurso"
  type        = map(string)
}