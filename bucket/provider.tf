provider "aws" {
  alias     = "demo_account"
  region    = "${var.region}"
  profile   = "${var.profile}"
  allowed_account_ids = ["${var.account_id}"]
}
