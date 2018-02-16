module "statements" {
	source = "./statements"
	//shared_services_role_arn = "${var.shared_services_role_arn}"
	providers = {
      "aws" = "${var.aws_provider}"
    }
}


resource "aws_iam_policy" "aws_policy" {
  name   = "${var.name}"
  path   = "/"
  policy = "${module.statements.policy_json}"

  //provider = "${var.provider}"
}