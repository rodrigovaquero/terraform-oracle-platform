output "id" {
  description = "ID da instância RDS"
  value       = aws_db_instance.this.id
}

output "endpoint" {
  description = "Endpoint de conexão do RDS"
  value       = aws_db_instance.this.endpoint
}

output "port" {
  description = "Porta do banco"
  value       = aws_db_instance.this.port
}

output "username" {
  description = "Usuário master"
  value       = aws_db_instance.this.username
}