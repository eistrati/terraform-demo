data "template_file" "default_instance_policy_json" {
  template = "${file("${path.module}/statements/ec2_policy.json")}"
}

resource "aws_iam_policy" "default_instance_policy" {
  name = "defaultInstancePolicy"
  description = "Policy to apply to all Instances in the organization."

  policy = "${data.template_file.default_instance_policy_json.rendered}"
}