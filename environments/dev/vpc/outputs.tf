output "vpc_id" {
  value = module.dev_vpc.vpc_id
}

output "private_subnet_cidrs" {
  value = module.dev_vpc.private_subnet_cidrs
}

output "private_subnet_ids" {
  value = module.dev_vpc.private_subnet_ids
}

output "public_subnet_cidrs" {
  value = module.dev_vpc.public_subnet_cidrs
}

output "public_subnet_ids" {
  value = module.dev_vpc.public_subnet_ids
}
