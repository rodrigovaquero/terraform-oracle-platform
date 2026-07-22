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

  ingress_rules = local.security_groups.app.ingress_rules

  egress_rules = local.security_groups.app.egress_rules

  tags = local.common_tags
}