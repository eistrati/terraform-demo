provider "aws" {
  region = "${var.region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

provider "aws" {
  region = "${var.region}"
  alias  = "account_01"

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id_01}:role/ClarivateCrossAccountRole"
    session_name = "${var.aws_account_id_01}"
  }
}

provider "aws" {
  region = "${var.region}"
  alias  = "account_02"

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id_02}:role/ClarivateCrossAccountRole"
    session_name = "${var.aws_account_id_02}"
  }
}
