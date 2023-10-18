variable "environment" {
  description = "Ambiente de desenvolvimento"
  default = "dev"
}
variable "vpc_cidr" {
  description = "cidr"
  default = "10.0.0.0/16"
}
variable "availability_zones" {
  type        = list
  description = "availability zone para as subnets"
  default = ["us-west-2a","us-west-2b"]
}
variable "public_subnets_cidr" {
  type        = list
  description = "public subnet"
  default = ["10.0.0.0/20", "10.0.16.0/20"]
}
variable "private_subnets_cidr" {
  type        = list
  description = "private subnet"
  default = ["10.0.128.0/20", "10.0.144.0/20"]
}
variable "region" {
  description = "Ambiente de desenvolvimento"
  default = "dev"
}