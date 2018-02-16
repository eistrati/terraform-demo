module "statements" {
  source    = "./statements"
  providers = {
    "aws" = "aws.account_00",
    "aws" = "aws.account_01",
    "aws" = "aws.account_02"
  }
}

resource "aws_iam_policy" "aws_policy_account_00" {
  name   = "${var.policy_name}"
  path   = "/"
  policy = "${module.statements.policy_json}"
  provider = "account_00"
}

resource "aws_iam_policy" "aws_policy_account_01" {
  name   = "${var.policy_name}"
  path   = "/"
  policy = "${module.statements.policy_json}"
  provider = "account_01"
}

resource "aws_iam_policy" "aws_policy_account_02" {
  name   = "${var.policy_name}"
  path   = "/"
  policy = "${module.statements.policy_json}"
  provider = "account_02"
}