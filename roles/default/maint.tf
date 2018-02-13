// Create roles to be assumed via OneLogin
module "test_policy" {
	source                   = "../../policies/test-policy/"
	name                     = "${var.policy_name}"
	shared_services_role_arn = "${var.shared_services_role_arn}"
}

resource "aws_iam_role" "test_role" {
  name               = "${var.role_name}"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.default-assume-role-policy.json}"
}

resource "aws_iam_role_policy_attachment" "test-attach" {
    role       = "${aws_iam_role.test_role.name}"
    policy_arn = "${module.test_policy.default_policy_arn}"
}