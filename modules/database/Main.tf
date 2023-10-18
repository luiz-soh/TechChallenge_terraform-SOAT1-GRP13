/*====Database Security Group ======*/
## Security Group for RDS Postgres
resource "aws_security_group" "rds-postgres-sg" {
  name        = "rds-postgres-sg-${var.environment}"
  description = "Security group for RDS Postgres"
  vpc_id      = var.vpc_id
  ingress {
    description     = "Postgres port"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = ["${var.bastion_security_group}"]
  }
}

resource "aws_db_instance" "postgresql_db" {
  allocated_storage      = 10
  db_name                = "TechChallenge"
  engine                 = "postgres"
  engine_version         = "15.4"
  instance_class         = "db.t4g.micro"
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  publicly_accessible    = false
  availability_zone      = var.availability_zone
  multi_az               = false
  db_subnet_group_name   = var.subnet_group_name
  vpc_security_group_ids = [aws_security_group.rds-postgres-sg.id]
}
