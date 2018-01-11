module "rds_restore" {
  source = "../modules/rds_restore/"

  region                 = "${var.region}"
  access_key             = "${var.access_key}"
  secret_key             = "${var.secret_key}"
  db_subnet_group_name   = "${var.db_subnet_group_name}"
  db_identifiers         = "${var.db_identifiers}"
  new_db_identifiers     = "${var.new_db_identifiers}"
  db_names               = "${var.db_names}"
  instances_class        = "${var.instances_class}"
  multi_az               = "${var.multi_az}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  skip_final_snapshot    = "${var.skip_final_snapshot}"
}
