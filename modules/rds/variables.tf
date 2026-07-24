variable "identifier" {
  description = "Nome da instância RDS"
  type        = string
}

variable "engine" {
  description = "Engine do banco"
  type        = string
}

variable "engine_version" {
  description = "Versão do engine"
  type        = string
}

variable "instance_class" {
  description = "Classe da instância RDS"
  type        = string
}

variable "allocated_storage" {
  description = "Storage em GB"
  type        = number
}

variable "db_subnet_group_name" {
  description = "Nome do DB Subnet Group"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Security Groups associados"
  type        = list(string)
}

variable "username" {
  description = "Usuário master do banco"
  type        = string
}

variable "password" {
  description = "Senha master do banco"
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "Nome do DB Parameter Group"
  type        = string
  default     = null
}