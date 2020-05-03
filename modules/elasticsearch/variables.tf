variable "app_name" {
  description = "Application name for naming prefix"
}

variable "environment" {
  description = "dev, staging, prod, etc"
}

variable "instance_count" {
  default = 1
}

variable "instance_class" {
  description = "Only t2.small.elasticsearch qualifies for free tier"
  default     = "t2.small.elasticsearch"
}

variable "es_version" {
  description = "AWS Elasticsearch version - https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/what-is-amazon-elasticsearch-service.html"
  default     = "6.8"
}

variable "es_zone_awareness" {
  default = false
}

variable "ebs_volume_size_gb" {
  description = "Free tier allows for up to 10GB of free storage"
  default     = 10
}

variable "snapshot_start_hour" {
  description = "Hour at which automated snapsots are taken, in UTC"
  default     = "05"
}

variable "create_iam_role" {
  description = "Whether to create IAM service linked role for AWS ElasticSearch service (only 1 per account)"
  default     = true
}

variable "subnet_ids" {
  description = "Private subnets to create ES cluster in - always chooses first in list"
  type        = list(string)
}

variable "vpc_id" {
  description = "Target VPC for ES cluster"
}
