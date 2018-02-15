module "create_role_account_00" {
	source = "./role"
	
	policy_name              = "${var.policy_name}"
    shared_services_role_arn = "arn:aws:iam::${var.aws_account_id_00}:role/ClarivateCrossAccountRole"
    role_name                = "${var.role_name}"
}

module "create_role_account_01" {
	source = "./role"

	providers = {
		"aws" = "aws.account_01"
	}
	
	policy_name              = "${var.policy_name}"
    shared_services_role_arn = "arn:aws:iam::${var.aws_account_id_01}:role/ClarivateCrossAccountRole"
    role_name                = "${var.role_name}"
}

module "create_role_account_02" {
	source = "./role"

	providers = {
		"aws" = "aws.account_02"
	}
	 
	policy_name              = "${var.policy_name}"
    shared_services_role_arn = "arn:aws:iam::${var.aws_account_id_02}:role/ClarivateCrossAccountRole"
    role_name                = "${var.role_name}"
}