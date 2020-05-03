terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "seanpsmithio"

    workspaces {
      name = "dev-openvpn"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "seanpsmithio-terraform"
}

#################################
# Optional Cloudflare DNS Entry #
#################################

data "cloudflare_zones" "selected" {
  filter {
    name   = "seanpsmith.io"
    status = "active"
  }
}

locals {
  cloudflare_zone_id = lookup(data.cloudflare_zones.selected.zones[0], "id")
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

module "dev_openvpn" {
  source             = "./../../../modules/openvpn"
  environment        = "dev"
  key_prefix         = "sps"
  subnet_id          = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id

//  cloudflare_zone_id = local.cloudflare_zone_id
}
