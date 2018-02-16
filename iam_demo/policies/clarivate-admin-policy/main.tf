module "statements" {
	source = "./statements"
	shared_services_role_arn = "${var.shared_services_role_arn}"
}


resource "aws_iam_policy" "aws_policy" {
  name   = "${var.name}"
  path   = "/"
  policy = "${module.statements.policy_json}"

  providers = {
  		"aws" = "${var.provider}"
  }
}