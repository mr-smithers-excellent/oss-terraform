################
# EC2 Instance #
################

locals {
  key_name = "${var.key_prefix}-${var.environment}-key"
}

resource "aws_instance" "openvpn" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = local.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.openvpn.id]
  source_dest_check           = false
  associate_public_ip_address = true

  tags = {
    Name        = "${var.environment}-openvpn"
    Environment = var.environment
  }
}

##################
# Cloudflare DNS #
##################

provider "cloudflare" {
  version = "~> 2.0"
}

resource "cloudflare_record" "openvpn" {
  count   = var.cloudflare_zone_id != "" ? 1 : 0
  name    = "${var.environment}-vpn"
  type    = "A"
  value   = aws_instance.openvpn.public_ip
  ttl     = 300
  zone_id = var.cloudflare_zone_id
}
