module "web_server_a" {
  source = "git@github.com:ifatoki/web-server-terraform.git?ref=develop"

  app_version = "a"
  elb_sg_id = aws_security_group.elb.id
  default_sg_id = aws_security_group.default.id
  default_subnet_id = aws_subnet.default.id
  key_id = aws_key_pair.auth.id
  aws_region = var.aws_region
}

output "web_server_a_address" {
  value = var.web_server_address_green == module.web_server_a.address ? "" : module.web_server_a.address
}

output "web_server_a_zone_id" {
  value = var.web_server_address_green == module.web_server_a.address ? "" : module.web_server_a.zone_id
}