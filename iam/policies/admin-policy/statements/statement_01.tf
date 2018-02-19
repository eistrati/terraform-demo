data "aws_iam_policy_document" "statement_01" {
  override_json = "${data.aws_iam_policy_document.statement_02.json}"

  statement {
    actions   = ["s3:*"]
    resources = ["*"]
  }
}