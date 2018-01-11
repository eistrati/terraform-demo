resource "aws_db_instance" "default" {
  count               = "${length(var.db_identifiers)}"
  snapshot_identifier = "${data.aws_db_snapshot.db_snapshot.*.id[count.index]}"
  engine              = "${data.aws_db_snapshot.db_snapshot.*.engine[count.index]}"
  engine_version      = "${data.aws_db_snapshot.db_snapshot.*.engine_version[count.index]}"
  license_model       = "${data.aws_db_snapshot.db_snapshot.*.license_model[count.index]}"

  #storage_type       = "${data.aws_db_snapshot.db_snapshot.*.storage_type}"
  allocated_storage   = "${data.aws_db_snapshot.db_snapshot.*.allocated_storage[count.index]}"
  availability_zone   = "${data.aws_db_snapshot.db_snapshot.*.availability_zone[count.index]}"
  snapshot_identifier = "${data.aws_db_snapshot.db_snapshot.*.id[count.index]}"
  skip_final_snapshot = "${var.skip_final_snapshot}"
  identifier          = "${element(var.new_db_identifiers, count.index)}"
  instance_class      = "${element(var.instances_class, length(var.instances_class) == length(var.db_identifiers) ? count.index : 0)}"
  multi_az            = "${var.multi_az}"

  name = "${element(var.db_names, length(var.db_names) == length(var.db_identifiers) ? count.index : 0)}"

  db_subnet_group_name   = "${var.db_subnet_group_name}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
}
