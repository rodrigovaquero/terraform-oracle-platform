resource "aws_db_instance" "this" {

  identifier = var.identifier

  username = var.username
  password = var.password

  engine         = var.engine
  engine_version = var.engine_version

  parameter_group_name = var.parameter_group_name


  instance_class = var.instance_class

  allocated_storage = var.allocated_storage
  storage_type      = "gp3"
  storage_encrypted = true

  db_subnet_group_name = var.db_subnet_group_name

  vpc_security_group_ids = var.vpc_security_group_ids

  publicly_accessible = false

  multi_az = false

  skip_final_snapshot = true


  tags = {
    Name = var.identifier
  }
}