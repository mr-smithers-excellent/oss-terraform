##########################
# Security Group for RDS #
##########################

locals {
  sg_name = "rds-${var.app_name}-${var.environment}"
}

resource "aws_security_group" "rds" {
  name        = local.sg_name
  description = "RDS ${title(var.app_name)} ${title(var.environment)}"
  vpc_id      = var.vpc_id

  tags = {
    Name = local.sg_name
  }
}

data "aws_security_group" "openvpn" {
  filter {
    name   = "tag:Name"
    values = ["${var.environment}-openvpn"]
  }
}

resource "aws_security_group_rule" "openvpn" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds.id
  source_security_group_id = data.aws_security_group.openvpn.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rds.id
}
