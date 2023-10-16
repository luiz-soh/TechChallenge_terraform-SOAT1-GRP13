# resource "random_id" "random_id_prefix" {
#   byte_length = 2
# }
/*====
Variables used across all modules
======*/
locals {
  dev_availability_zones = ["${var.region}a", "${var.region}b"]
}

module "networking" {
  source = "./modules/networking"

  region               = "${var.region}"
  environment          = "${var.environment}"
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnets_cidr  = "${var.public_subnets_cidr}"
  private_subnets_cidr = "${var.private_subnets_cidr}"
  availability_zones   = "${local.dev_availability_zones}"
}

module "databases" {
  source = "./modules/database"

  availability_zones   = "${local.dev_availability_zones[0]}"
  security_group_id = module.networking.database_security_group_id
}