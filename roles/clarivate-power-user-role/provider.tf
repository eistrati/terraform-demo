provider "aws" {
  region = "${var.region}"
  assume_role {
    role_arn = "${var.shared_services_role_arn}"
  }
}