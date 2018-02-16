data "aws_iam_policy_document" "statement_s3" {
  statement {
    actions   = ["s3:*"]
    resources = ["*"]
  }
}