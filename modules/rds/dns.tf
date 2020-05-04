#######################
# Route53 Private DNS #
#######################

data "aws_route53_zone" "selected" {
  zone_id = var.route53_zone_id
}

resource "aws_route53_record" "rds" {
  name    = var.rds_dns_name
  type    = "CNAME"
  ttl     = "300"
  records = [module.rds.this_db_instance_address]
  zone_id = data.aws_route53_zone.selected.id
}
