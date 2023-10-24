/*=============RDS=================*/
resource "aws_security_group" "rds-postgres-sg" {
  name        = "rds-postgres-sg-${var.environment}"
  description = "Security group for RDS Postgres"
  vpc_id      = var.vpc_id
  ingress {
    description = "Postgres port"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks   = ["0.0.0.0/0"] //LIberando todos os IPs para permitir o teste mas o correto seria liberar apenas o IP de quem for utilizar
  }
  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "Security-group-RDS"
    Environment = "${var.environment}"
  }
}

resource "aws_db_instance" "postgresql_db" {
  allocated_storage      = 20
  db_name                = "TechChallenge"
  engine                 = "postgres"
  engine_version         = "15.4"
  instance_class         = "db.t4g.micro"
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  publicly_accessible    = true
  availability_zone      = var.availability_zone
  multi_az               = false
  db_subnet_group_name   = var.subnet_group_name
  vpc_security_group_ids = [aws_security_group.rds-postgres-sg.id]
  tags = {
    Name        = "RDS"
    Environment = "${var.environment}"
  }
}

/*=============DynamoDB=================*/
resource "aws_dynamodb_table" "customer_db" {
  name                        = "customers_cache"
  billing_mode                = "PAY_PER_REQUEST"
  hash_key                    = "userId"
  stream_enabled              = false
  table_class                 = "STANDARD"
  deletion_protection_enabled = false

  ttl {
    enabled        = true
    attribute_name = "ttl"
  }


  attribute {
    name = "userId"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  tags = {
    Name        = "DynamoDB"
    Environment = "${var.environment}"
  }
}
