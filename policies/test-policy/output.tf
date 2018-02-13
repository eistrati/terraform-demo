output "default_policy_id" {
  value = "${aws_iam_policy.test_policy.id}"
}

output "default_policy_name" {
  value = "${aws_iam_policy.test_policy.name}"
}

output "default_policy_arn" {
  value = "${aws_iam_policy.test_policy.arn}"
}
