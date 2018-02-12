provider "aws" {
  alias = "acme_operations"
  profile = "acme_operations"
  region = "${var.aws_default_region}"
  shared_credentials_file = "./credentials"
  allowed_account_ids = ["${var.aws_account_id}"]
}