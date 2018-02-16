data "aws_iam_policy_document" "default_assume_role_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy" "aws_policy_arn_account_00" {
  arn = "arn:aws:iam::${var.aws_account_id_00}:policy/${var.policy_name}"
}

data "aws_iam_policy" "aws_policy_arn_account_01" {
  arn = "arn:aws:iam::${var.aws_account_id_00}:policy/${var.policy_name}"
}

data "aws_iam_policy" "aws_policy_arn_account_02" {
  arn = "arn:aws:iam::${var.aws_account_id_00}:policy/${var.policy_name}"
}