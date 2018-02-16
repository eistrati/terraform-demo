module "statements" {
	source = "./statements"
}


resource "aws_iam_policy" "aws_policy" {
  name   = "${var.name}"
  path   = "/"
  policy = "${module.statements.policy_json}"
}