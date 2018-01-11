data "vault_generic_secret" "db_credentials" {
 path = "secret/db_creds"
}

resource "aws_instance" "EC2Instance" {
  tags {
    Name = "TerraformInstance"
    Description = "Terraform Description"
  }

  # VPC
  #vpc_security_group_ids  = [ "${var.vpc_id}" ]
  subnet_id = "${var.subnet_id}"

  availability_zone = "${var.availability_zone}"
  security_groups   = ["${var.security_groups}"]

  # Instance
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"

  # Advanced
  source_dest_check       = true
  ebs_optimized           = false
  disable_api_termination = false
}

/*
resource "aws_db_instance" "RdsInstance" {
  tags {
    Name = "TerraformDatabase"
  }

  license_model     = "${var.oracle_license_model}"
  engine            = "${var.rds_engine_type}"
  engine_version    = "${var.rds_engine_version}"
  instance_class    = "${var.rds_instance_class}"
  storage_type      = "${var.rds_storage_type}"
  allocated_storage = "${var.rds_allocated_storage}"
  identifier        = "${var.rds_instance_identifier}"
  name              = "${var.database_name}"
#  username          = "${var.database_user}"
#  password          = "${var.database_password}"
  username          = "${data.vault_generic_secret.db_credentials.data["database_user"]}"
  password          = "${data.vault_generic_secret.db_credentials.data["database_password"]}"
  port              = "${var.database_port}"

  # we want the multi-az setting to be toggleable, but off by default
  multi_az = "${var.rds_is_multi_az}"

  # upgrades
  auto_minor_version_upgrade = "${var.auto_minor_version_upgrade}"
  maintenance_window         = "${var.maintenance_window}"

  # snapshots and backups
  copy_tags_to_snapshot   = "${var.copy_tags_to_snapshot}"
  backup_retention_period = "${var.backup_retention_period}"
  backup_window           = "${var.backup_window}"

  # enhanced monitoring
  monitoring_interval = "${var.monitoring_interval}"

  skip_final_snapshot       = true
  final_snapshot_identifier = "RdsInstance-final"
}
*/