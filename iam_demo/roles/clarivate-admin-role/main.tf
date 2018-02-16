module "aws_policy" {
  source             = "../../policies/clarivate-admin-policy/"
  aws_account_id_00  = "${var.aws_account_id_00}"
  aws_account_id_01  = "${var.aws_account_id_01}"
  aws_account_id_02  = "${var.aws_account_id_02}"
  policy_name        = "${var.policy_name}"
}

resource "aws_iam_role" "aws_role_account_00" {
  name               = "${var.role_name}"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.default_assume_role_policy.json}"
  provider           = "aws.account_00"
}

resource "aws_iam_role_policy_attachment" "role_attach_account_00" {
  role               = "${aws_iam_role.aws_role_account_00.name}"
  policy_arn         = "${module.aws_policy.aws_policy_arn_account_00}"
}

resource "aws_iam_role" "aws_role_account_01" {
  name               = "${var.role_name}"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.default_assume_role_policy.json}"
  provider           = "aws.account_01"
}

resource "aws_iam_role_policy_attachment" "role_attach_account_01" {
  role               = "${aws_iam_role.aws_role_account_01.name}"
  policy_arn         = "${module.aws_policy.aws_policy_arn_account_01}"
}

resource "aws_iam_role" "aws_role_account_02" {
  name               = "${var.role_name}"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.default_assume_role_policy.json}"
  provider           = "aws.account_02"
}

resource "aws_iam_role_policy_attachment" "role_attach_account_02" {
  role               = "${aws_iam_role.aws_role_account_02.name}"
  policy_arn         = "${module.aws_policy.aws_policy_arn_account_02}"
}