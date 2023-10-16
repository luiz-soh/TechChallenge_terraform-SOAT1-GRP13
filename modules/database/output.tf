output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = try(aws_db_instance.postgresql_db.address, null)
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = try(aws_db_instance.postgresql_db.availability_zone, null)
}

output "db_instance_engine" {
  description = "The database engine"
  value       = try(aws_db_instance.postgresql_db.engine, null)
}

output "db_instance_name" {
  description = "The database name"
  value       = try(aws_db_instance.postgresql_db.db_name, null)
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = try(aws_db_instance.postgresql_db.username, null)
  sensitive   = true
}

output "db_instance_port" {
  description = "The database port"
  value       = try(aws_db_instance.postgresql_db.port, null)
}

