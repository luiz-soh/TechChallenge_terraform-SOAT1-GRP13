variable "availability_zones" {
  description = "availability zone para as subnets"
  default = "us-west-2a"
}

variable "security_group_id" {
    description = "Security group Id from networking module"
}

variable "subnet_group_name"{
  description = "Subnet group name to indicate where the RDS will be installed"
}