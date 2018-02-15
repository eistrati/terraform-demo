provider "aws" {
  region = "${var.region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

provider "aws" {
  region = "${var.region}"
  alias  = "ad_tech_media"
  allowed_account_ids = ["${var.aws_account_id}"]

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id_ad_tech_media}:role/ClarivateCrossAccountRole"
  }
}

provider "aws" {
  region = "${var.region}"
  alias  = "mitoc_group"
  allowed_account_ids = ["${var.aws_account_id}"]

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id_mitoc_group}:role/ClarivateCrossAccountRole"
  }
}