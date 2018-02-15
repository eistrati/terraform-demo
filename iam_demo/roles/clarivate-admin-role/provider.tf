provider "aws" {
  region = "${var.region}"
  allowed_account_ids = ["${var.aws_account_id_00}"]
}

provider "aws" {
  region = "${var.region}"
  alias  = "account_01"

  allowed_account_ids = ["${var.aws_account_id_01}"]
}

provider "aws" {
  region = "${var.region}"
  alias  = "account_02"

  allowed_account_ids = ["${var.aws_account_id_02}"]
}