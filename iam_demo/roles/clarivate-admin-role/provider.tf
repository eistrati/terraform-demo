provider "aws" {
  region = "${var.region}"
  alias  = "account_00"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

provider "aws" {
  region = "${var.region}"
  alias  = "account_01"

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id_01}:role/ClarivateCrossAccountRole"
  }
}

provider "aws" {
  region = "${var.region}"
  alias  = "account_02"

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id_02}:role/ClarivateCrossAccountRole"
  }
}