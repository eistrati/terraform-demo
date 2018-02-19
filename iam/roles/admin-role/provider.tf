provider "aws" {
  alias  = "account_00"
  region = "us-east-1"
  // allowed_account_ids = ["${var.aws_account_id_00}"]
}

provider "aws" {
  alias  = "account_01"
  profile  = "account_01"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id_01}:role/ClarivateCrossAccountRole"
    session_name = "${var.aws_account_id_01}"
  }
}

provider "aws" {
  alias  = "account_02"
  profile  = "account_02"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id_02}:role/ClarivateCrossAccountRole"
    session_name = "${var.aws_account_id_02}"
  }
}