provider "aws" {
  profile = "${var.aws_profile}"
  region = "${var.region}"
  allowed_account_ids = ["${var.aws_account_id}"]
  assume_role {
    role_arn = "${var.shared_services_role_arn}"
  }
}