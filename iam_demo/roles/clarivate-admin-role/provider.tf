provider "aws" {
  region = "${var.region}"
  access_key = "${var.aws_access_key_00}"
  secret_key = "${var.aws_secret_key_00}"
}

provider "aws" {
  region = "${var.region}"
  alias  = "account_01"

  access_key = "${var.aws_access_key_01}"
  secret_key = "${var.aws_secret_key_01}"
}

provider "aws" {
  region = "${var.region}"
  alias  = "account_02"

  access_key = "${var.aws_access_key_02}"
  secret_key = "${var.aws_secret_key_02}"
}