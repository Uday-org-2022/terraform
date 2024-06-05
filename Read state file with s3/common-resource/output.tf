output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.vpc.arn
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.subnet.id
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = aws_route_table.rt.id
}


output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = aws_internet_gateway.igw.arn
}

