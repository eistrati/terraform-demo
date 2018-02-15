data "aws_iam_policy_document" "default-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    resources = ["${var.shared_services_role_arn}"]
  }
}