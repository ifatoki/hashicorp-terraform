module "web_server_blue" {
  source = "git@github.com:ifatoki/web-server-terraform.git?ref=develop"

  app_version = "100"
  vpc_route_table_id = aws_vpc.default.main_route_table_id
  elb_sg_id = aws_security_group.elb.id
  default_sg_id = aws_security_group.default.id
  default_ig_id = aws_internet_gateway.default.id
  default_subnet_id = aws_subnet.default.id
  key_id = aws_key_pair.auth.id
  aws_region = var.aws_region
}