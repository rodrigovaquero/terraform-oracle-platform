output "subnet_ids" {
  description = "IDs das subnets"

  value = {
    for name, subnet in aws_subnet.this :
    name => subnet.id
  }
}