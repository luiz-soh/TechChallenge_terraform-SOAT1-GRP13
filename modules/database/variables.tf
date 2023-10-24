variable "availability_zone" {
  description = "availability zone para as subnets"
  default     = "us-west-2a"
}

variable "subnet_group_name" {
  description = "Subnet group name to indicate where the RDS will be installed"
}

variable "db_username" {
  description = "us-west-2"
}

variable "db_password" {
  description = "us-west-2"
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}
