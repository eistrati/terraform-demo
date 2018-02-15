output "aws_policy_id" {
  value = "${aws_iam_policy.aws_policy.id}"
}

output "aws_policy_name" {
  value = "${aws_iam_policy.aws_policy.name}"
}

output "aws_policy_arn" {
  value = "${aws_iam_policy.aws_policy.arn}"
}
