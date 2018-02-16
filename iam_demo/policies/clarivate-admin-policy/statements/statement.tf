data "aws_iam_policy_document" "statement" {
  override_json = "${data.aws_iam_policy_document.statement_s3.json}"

  statement {
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

	actions   = ["ec2:*"]
	resources = ["*"]
  }
}