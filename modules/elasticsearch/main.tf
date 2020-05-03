module "es" {
  source                         = "git::https://github.com/terraform-community-modules/tf_aws_elasticsearch.git?ref=v1.3.0"
  domain_name                    = "${var.environment}-domain"
  instance_count                 = var.instance_count
  instance_type                  = var.instance_class
  es_version                     = var.es_version
  es_zone_awareness              = var.es_zone_awareness
  ebs_volume_size                = var.ebs_volume_size_gb
  snapshot_start_hour            = var.snapshot_start_hour
  create_iam_service_linked_role = var.create_iam_role

  vpc_options = {
    security_group_ids = [aws_security_group.es.id]
    subnet_ids         = [var.subnet_ids[0]]
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }
}
