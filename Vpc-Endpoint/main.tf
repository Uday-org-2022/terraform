
locals {
  endpoint1 = "Interface"
  endpoint2 = "Gateway"
}

resource "aws_vpc_endpoint" "Interface-endpoint" {
  vpc_id              = aws_vpc.endpoint-vpc.id
  service_name        = var.service_name
  vpc_endpoint_type   = local.endpoint1
  security_group_ids  = [aws_security_group.main.id]
  subnet_ids          = [aws_subnet.private_subnet.id]
  private_dns_enabled = var.false

  tags = {
    "Name" = var.endpoint-tags1
  }
}

/*
resource "aws_vpc_endpoint" "Gateway-endpoint" {
  vpc_id             = aws_vpc.endpoint-vpc.id
  service_name       = var.service_name
  vpc_endpoint_type  = local.endpoint2
  security_group_ids = [aws_security_group.main.id]

  route_table_ids = [aws_route_table.private-rt.id]

  tags = {
    "Name" = var.endpoint-tags2
  }
}
*/