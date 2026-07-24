resource "aws_db_parameter_group" "this" {

  name   = var.name
  family = var.family

  dynamic "parameter" {

    for_each = var.parameters

    content {

      name  = parameter.value.name
      value = parameter.value.value

      apply_method = "pending-reboot"
    }
  }

  tags = var.tags
}