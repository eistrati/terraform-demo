// Create roles to be assumed via OneLogin
resource "aws_iam_role" "acme_operations_administrator" {
  name = "default"
  assume_role_policy = "${data.aws_iam_policy_document.acme_operations_onelogin_crossaccount_assume.json}"
  provider = "aws.acme_operations"
}

resource "aws_iam_role_policy_attachment" "acme_operations_administrator" {
  role = "${aws_iam_role.acme_operations_administrator.name}"
  policy_arn = "${var.administrator_default_arn}"
  provider = "aws.acme_operations"
}
