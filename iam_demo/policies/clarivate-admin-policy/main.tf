module "statements" {
  source = "./statements"
}

resource "aws_iam_policy" "aws_policy_account_00" {
  name     = "${var.policy_name}"
  path     = "/"
  policy   = "${module.statements.policy_json}"
  provider = "aws.account_00"
}

resource "aws_iam_policy" "aws_policy_account_01" {
  name     = "${var.policy_name}"
  path     = "/"
  policy   = "${module.statements.policy_json}"
  provider = "aws.account_01"
}

resource "aws_iam_policy" "aws_policy_account_02" {
  name     = "${var.policy_name}"
  path     = "/"
  policy   = "${module.statements.policy_json}"
  provider = "aws.account_02"
}