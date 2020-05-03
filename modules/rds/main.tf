locals {
  rds_identifer = "${var.app_name}-${var.environment}"
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier                = local.rds_identifer
  engine                    = var.engine
  engine_version            = var.engine_version
  major_engine_version      = var.major_engine_family
  family                    = var.engine_family
  instance_class            = var.instance_class
  allocated_storage         = var.allocated_storage_gb
  maintenance_window        = var.maintenance_window
  backup_window             = var.backup_window
  create_monitoring_role    = var.create_monitoring_role
  final_snapshot_identifier = local.rds_identifer
  deletion_protection       = var.deletion_protection
  vpc_security_group_ids    = [aws_security_group.rds.id]
  subnet_ids                = var.private_subnet_ids

  name     = var.db_name
  username = var.db_user
  password = var.db_user_password
  port     = var.db_port

  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  tags = {
    App         = var.app_name
    Environment = var.environment
  }

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8"
    },
    {
      name  = "character_set_server"
      value = "utf8"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}
