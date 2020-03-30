output "vpc_route_table_id" {
  value = aws_vpc.default.main_route_table_id
}

output "elb_sg_id" {
  value = aws_security_group.elb.id
}

output "default_sg_id" {
  value = aws_security_group.default.id
}

output "key_id" {
  value = aws_key_pair.auth.id
}

output "default_subnet_id" {
  value = aws_subnet.default.id
}

output "default_ig_id" {
  value = aws_internet_gateway.default.id
}