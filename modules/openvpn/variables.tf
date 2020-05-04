variable "region" {
  default = "us-west-2"
}

variable "environment" {
  description = "dev, staging, prod, etc."
}

variable "ami_id" {
  description = "Latest version of OpenVPN available on AWS Marketplace"
  default     = "ami-034692da3c6768a18"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_prefix" {
  description = "SSH key prefix"
}

variable "vpc_id" {
  description = "Target VPC for EC2"
}

variable "subnet_id" {
  description = "Target subnet for EC2"
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID for DNS entry"
}
