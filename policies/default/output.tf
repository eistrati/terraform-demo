output "default_instance_policy_id" {
  value = "${aws_iam_policy.default_instance_policy.id}"
}

output "default_instance_policy_name" {
  value = "${aws_iam_policy.default_instance_policy.name}"
}
