module "aws_policy" {
  source             = "../../../policies/clarivate-admin-policy/"
  name               = "${var.policy_name}"
  provider           = "${var.provider}"
}

resource "aws_iam_role" "aws_role" {
  name               = "${var.role_name}"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.default-assume-role-policy.json}"
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role               = "${aws_iam_role.aws_role.name}"
  policy_arn         = "${module.aws_policy.aws_policy_arn}"
}