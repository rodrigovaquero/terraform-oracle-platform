output "id" {
  description = "ID do DB Subnet Group"
  value       = aws_db_subnet_group.this.id
}

output "name" {
  description = "Nome do DB Subnet Group"
  value       = aws_db_subnet_group.this.name
}