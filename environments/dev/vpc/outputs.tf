output "vpc_id" {
  value = module.dev_vpc.vpc_id
}

output "private_subnet_cidrs" {
  value = module.dev_vpc.private_subnets_cidr_blocks
}

output "private_subnet_ids" {
  value = module.dev_vpc.private_subnets
}

output "public_subnet_cidrs" {
  value = module.dev_vpc.public_subnets_cidr_blocks
}

output "public_subnet_ids" {
  value = module.dev_vpc.public_subnets
}
