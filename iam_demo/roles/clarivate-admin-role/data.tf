data "aws_iam_policy_document" "default_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
  }
}