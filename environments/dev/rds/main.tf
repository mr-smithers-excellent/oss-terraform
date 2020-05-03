terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "seanpsmithio"

    workspaces {
      name = "dev-rds"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "seanpsmithio-terraform"
}

################
# Retrieve VPC #
################

data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "seanpsmithio"
    workspaces = {
      name = "dev-vpc"
    }
  }
}

module "rds" {
  source             = "./../../../modules/rds"
  environment        = "dev"
  region             = "us-west-2"
  db_name            = "starbucks"
  db_user            = "starbucks_user"
  db_user_password   = "ilikecoffee"
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  private_zone_id    = "Z0111603GXSYHUQIMK66"
  rds_dns_name       = "rds.dev.seanpsmith.io"
}
