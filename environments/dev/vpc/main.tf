terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "seanpsmithio"

    workspaces {
      name = "dev-vpc"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "seanpsmithio-terraform"
}

module "dev_vpc" {
  source      = "./../../../modules/vpc"
  environment = "dev"
}
