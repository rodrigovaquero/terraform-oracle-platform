variable "vpc_id" {
  description = "ID da VPC"

  type = string
}

variable "tags" {
  description = "Tags comuns"

  type = map(string)

  default = {}
}

variable "subnets" {
  description = "Lista de subnets"

  type = map(object({
    cidr_block        = string
    availability_zone = string
    subnet_type       = string
  }))
}