module "web_server_b" {
  source = "git@github.com:ifatoki/web-server-terraform.git?ref=develop"

  app_version = "b"
  vpc_route_table_id = aws_vpc.default.main_route_table_id
  elb_sg_id = aws_security_group.elb.id
  default_sg_id = aws_security_group.default.id
  default_ig_id = aws_internet_gateway.default.id
  default_subnet_id = aws_subnet.default.id
  key_id = aws_key_pair.auth.id
  aws_region = var.aws_region
}

output "web_server_b_address" {
  value = var.web_server_address_green == module.web_server_b.address ? "" : module.web_server_b.address
}

output "web_server_b_zone_id" {
  value = var.web_server_address_green == module.web_server_b.address ? "" : module.web_server_b.zone_id
}