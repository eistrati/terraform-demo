resource "aws_instance" "EC2Instance" {
  tags {
    Name        = "Terraform Instance"
    Description = "Terraform Description"
  }

  # VPC
  #vpc_security_group_ids  = [ "${var.vpc_id}" ]
  subnet_id                = "${var.subnet_id}"

  availability_zone = "${var.availability_zone}"
  security_groups   = ["${var.security_groups}"]

  # Instance
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"

  # Advanced
  source_dest_check       = true
  ebs_optimized           = false
  disable_api_termination = false
}
