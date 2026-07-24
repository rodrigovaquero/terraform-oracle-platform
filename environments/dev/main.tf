module "network" {

  source = "../../modules/vpc"

  vpc_cidr = "10.10.0.0/16"

  tags = local.common_tags
}

module "internet_gateway" {

  source = "../../modules/internet-gateway"

  vpc_id = module.network.vpc_id

  tags = local.common_tags
}

module "subnets" {

  source = "../../modules/subnet"

  vpc_id = module.network.vpc_id

  subnets = local.subnets

  tags = local.common_tags
}

module "route_tables" {

  source = "../../modules/route-table"

  vpc_id = module.network.vpc_id

  route_tables = {

    public = {

      routes = [
        {
          cidr_block  = "0.0.0.0/0"
          target_type = "internet_gateway"
          target_id   = module.internet_gateway.id
        }
      ]

    }

  }

  tags = local.common_tags
}

module "route_table_association" {

  source = "../../modules/route-table-association"


  associations = {

    public-a = {

      subnet_id = module.subnets.subnet_ids["public-a"]

      route_table_id = module.route_tables.route_table_ids["public"]

    }


    public-b = {

      subnet_id = module.subnets.subnet_ids["public-b"]

      route_table_id = module.route_tables.route_table_ids["public"]

    }

  }

}

module "security_group_app" {

  source = "../../modules/security-group"

  name        = "app"
  description = local.security_groups.app.description

  vpc_id = module.network.vpc_id

  ingress_rules = [
    {
      description              = "Allow application traffic from ALB"
      from_port                = 8080
      to_port                  = 8080
      protocol                 = "tcp"
      cidr_blocks              = []
      source_security_group_id = module.security_group_alb.id
    }
  ]

  egress_rules = local.security_groups.app.egress_rules

  tags = local.common_tags
}

module "security_group_rds" {

  source = "../../modules/security-group"

  name = "rds"

  description = local.security_groups.rds.description

  vpc_id = module.network.vpc_id

  ingress_rules = [{
    description              = "Allow PostgreSQL traffic from app"
    from_port                = 5432
    to_port                  = 5432
    protocol                 = "tcp"
    cidr_blocks              = []
    source_security_group_id = module.security_group_app.id
    }
  ]

  egress_rules = local.security_groups.rds.egress_rules

  tags = local.common_tags
}

module "security_group_alb" {

  source = "../../modules/security-group"

  name        = "alb"
  description = local.security_groups.alb.description

  vpc_id = module.network.vpc_id

  ingress_rules = local.security_groups.alb.ingress_rules

  egress_rules = local.security_groups.alb.egress_rules

  tags = local.common_tags
}

module "db_subnet_group" {

  source = "../../modules/db-subnet-group"

  name = "${local.common_tags.Environment}-db-subnet-group"

  subnet_ids = [
    module.subnets.subnet_ids["private-a"],
    module.subnets.subnet_ids["private-b"]
  ]

  tags = local.common_tags
}

module "rds" {

  source = "../../modules/rds"

  identifier = "${local.common_tags.Environment}-postgres"

  engine = "postgres"

  engine_version = "16.14"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  db_subnet_group_name = module.db_subnet_group.name

  parameter_group_name = module.postgres_parameter_group.name


  vpc_security_group_ids = [
    module.security_group_rds.id
  ]

  username = "postgres"

  password = "SenhaTemporaria123!"

}

module "postgres_parameter_group" {

  source = "../../modules/db-parameter-group"

  name = "dev-postgres"

  family = "postgres16"

  parameters = [
    {
      name  = "log_min_duration_statement"
      value = "1000"
    }
  ]

  tags = local.common_tags
}