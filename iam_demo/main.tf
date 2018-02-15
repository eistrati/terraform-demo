module "create_role_cloud_native_ci" {
	source = "./roles/${var.role_name}"
	
	policy_name              = "${var.policy_name}"
    shared_services_role_arn = "arn:aws:iam::${var.aws_account_id}:role/ClarivateCrossAccountRole"
    role_name                = "${var.role_name}"
}

module "create_role_ad_tech_media" {
	source = "./roles/${var.role_name}"
	provider = "aws.ad_tech_media"
	policy_name              = "${var.policy_name}"
    shared_services_role_arn = "arn:aws:iam::${var.aws_account_id_ad_tech_media}:role/ClarivateCrossAccountRole"
    role_name                = "${var.role_name}"
}

module "create_role_mitoc_group" {
	source = "./roles/${var.role_name}"
	provider = "aws.mitoc_group"
	policy_name              = "${var.policy_name}"
    shared_services_role_arn = "arn:aws:iam::${var.aws_account_id_mitoc_group}:role/ClarivateCrossAccountRole"
    role_name                = "${var.role_name}"
}