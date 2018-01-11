data "aws_db_snapshot" "db_snapshot" {
  count                  = "${length(var.db_identifiers)}"
  most_recent            = true
  db_instance_identifier = "${element(var.db_identifiers, count.index)}"
}
