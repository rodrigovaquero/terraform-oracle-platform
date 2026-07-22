variable "name" {
  description = "Nome do Security Group"
  type        = string
}

variable "description" {
  description = "Descrição do Security Group"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}


variable "ingress_rules" {
  description = "Regra de entrada do Security Group"

  type = list(object({
    description              = string
    from_port                = number
    to_port                  = number
    protocol                 = string
    cidr_blocks              = optional(list(string))
    source_security_group_id = optional(string)
  }))
}

variable "egress_rules" {
  description = "Regras de saída do Security Group"

  type = list(object({
    description              = string
    from_port                = number
    to_port                  = number
    protocol                 = string
    cidr_blocks              = optional(list(string))
    source_security_group_id = optional(string)
  }))
}

variable "tags" {
  description = "Tags do recurso"
  type        = map(string)
}
