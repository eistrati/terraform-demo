data "aws_iam_policy_document" "statement_s3" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions   = ["s3:*"]
    resources = ["*"]
  }
}