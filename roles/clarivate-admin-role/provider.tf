provider "aws" {
  region = "${var.region}"
  allowed_account_ids = ["${var.account_id}"]

  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/${var.iam_role_to_assume}"
  }
}