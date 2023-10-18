variable "region" {
  description = "us-west-2"
}

variable "environment" {
  description = "The Deployment environment"
}

//Networking
variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR block for the private subnet"
}
variable "availability_zones" {
  type        = list
  description = "availability zone to the subnets"
}

variable "profile" {
  description = "AWS profile to create resources"
}

variable "db_username" {
  description = "us-west-2"
}

variable "db_password" {
  description = "us-west-2"
}