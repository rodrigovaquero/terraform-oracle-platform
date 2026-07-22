output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_arn" {
  value = aws_vpc.this.arn
}

output "vpc_cidr" {
  value = aws_vpc.this.cidr_block
}