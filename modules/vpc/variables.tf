variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
  }

variable "tags" {
    description = "Tags aplicadas à VPC"  
    type = map(string)
    default = {}

}

