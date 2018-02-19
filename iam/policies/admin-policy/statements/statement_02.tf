data "aws_iam_policy_document" "statement_02" {
  statement {
    actions   = ["dynamodb:*"]
    resources = ["*"]
  }
}