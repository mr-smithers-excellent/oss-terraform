variable "region" {
  description = "Region for RDS instance"
}

variable "environment" {
  description = "dev, staging, prod, etc"
}

variable "vpc_id" {
  description = "Target VPC for RDS instance"
}

variable "engine" {
  default = "mysql"
}

variable "engine_version" {
  default = "5.7.28"
}

variable "major_engine_family" {
  default = "5.7"
}

variable "engine_family" {
  default = "mysql5.7"
}

variable "instance_class" {
  description = "Note only db.t2.micro qualifies for AWS free tier"
  default = "db.t2.micro"
}

variable "allocated_storage_gb" {
  default = "5"
}

variable "private_subnet_ids" {
  description = "Target private subnets for RDS instance"
}

variable "db_name" {
  description = "Name of database to be created"
}

variable "db_user" {
  description = "Username to be created"
}

variable "db_user_password" {
  description = "Password for above user"
}

variable "db_port" {
  default = "3306"
}

variable "iam_database_authentication_enabled" {
  default = false
}

variable "maintenance_window" {
  default = "Mon:00:00-Mon:03:00"
}

variable "backup_window" {
  default = "03:00-06:00"
}

variable "create_monitoring_role" {
  default = false
}

variable "deletion_protection" {
  default = false
}

variable "route53_zone_id" {
  description = "Route53 zone for DNS entry"
}

variable "rds_dns_name" {
  description = "DNS hostname for Route53 entry"
}
