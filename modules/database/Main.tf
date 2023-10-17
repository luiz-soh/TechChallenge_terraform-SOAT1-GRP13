resource "aws_db_instance" "postgresql_db" {
  allocated_storage    = 10
  db_name              = "TechChallenge"
  engine               = "postgres"
  engine_version       = "15.4"
  instance_class       = "db.t4g.micro"
  username             = "fiap"
  password             = "30r2OEb^p*T0"
  skip_final_snapshot  = true
  publicly_accessible = true
  availability_zone    = "${var.availability_zones}"
  multi_az = false
  db_subnet_group_name = "${var.subnet_group_name}"
  # vpc_security_group_ids = var.security_group_id
}