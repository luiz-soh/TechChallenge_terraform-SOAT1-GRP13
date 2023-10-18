output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_id" {
  value       = aws_subnet.public_subnet[*].id
  description = "The ID of the subnet."
}

output "private_subnet_id" {
  value       = aws_subnet.private_subnet[*].id
  description = "The ID of the private subnet."
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.tech_challenge_sg.id
}

# output "database_security_group_id" {
#   description = "The ID of the security group"
#   value       = aws_security_group.database_sg.id
# }

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.tech_challenge_sg.name
}

output "db_subnet_group_name" {
  description = "The name of the subnet group"
  value       = aws_db_subnet_group.db_subnet.name
}