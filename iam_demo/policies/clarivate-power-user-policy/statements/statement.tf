data "aws_iam_policy_document" "statement" {
  override_json = "${data.aws_iam_policy_document.statement_01.json}"

  statement {
    actions   = ["ec2:*"]
    resources = ["*"]
  }
}