locals {
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "oracle-platform"
  }

  subnets = {

    public-a = {
      cidr_block        = "10.10.1.0/24"
      availability_zone = "sa-east-1a"
      subnet_type       = "public"
    }

    public-b = {
      cidr_block        = "10.10.2.0/24"
      availability_zone = "sa-east-1b"
      subnet_type       = "public"
    }

    private-a = {
      cidr_block        = "10.10.11.0/24"
      availability_zone = "sa-east-1a"
      subnet_type       = "private"
    }

    private-b = {
      cidr_block        = "10.10.12.0/24"
      availability_zone = "sa-east-1b"
      subnet_type       = "private"
    }
  }

  security_groups = {

    app = {

      description = "Application Security Group"

      ingress_rules = []

      egress_rules = [
        {
          description = "Allow all outbound traffic"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }

    rds = {

      description = "RDS Security Group"

      ingress_rules = []

      egress_rules = [
        {
          description = "Allow all outbound traffic"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }


    alb = {

      description = "ALB Security Group"

      ingress_rules = [
        {
          description = "Allow HTTPS from internet"
          from_port   = 443
          to_port     = 443
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_rules = [
        {
          description = "Allow all outbound traffic"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }

  }
}