terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "seanpsmithio"

    workspaces {
      name = "dev-elasticsearch"
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

module "elasticsearch" {
  source        = "./../../../modules/elasticsearch"
  environment   = "dev"
  subnet_ids    = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  vpc_id        = data.terraform_remote_state.vpc.outputs.vpc_id
}
