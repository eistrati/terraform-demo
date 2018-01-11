provider "aws" {
  version = "~> 0.1"
  #shared_credentials_file = "~/.aws/credentials"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

#
#	aws provider for the account we are deploying into. This is the default provider and what the modules will use.
#
#provider "aws" {
#	region = "${module.vpc-info.region}"
#	allowed_account_ids = ["${module.aws-account-info.aws_account_id}"]
#
#	assume_role {
#		role_arn = "${module.aws-account-info.role_to_assume}"
#		session_name = "${module.vpc-info.account}-session"
#	}
#}

#
#	Provider for aws devops. To run this script you either need to set the aws
#		env vars to a devops account that can assume roles in other accounts
#		or run this on a devops host with the proper IAM role. It is really
#		meant to be run on the jenkins slaves (which, ironically, requires 
#		aws access and secret keys set because the IAM profile cannot assume roles.
#
#provider "aws" {
#	alias = "devops"
#	allowed_account_ids = ["${module.aws-account-devops-info.aws_account_id}"]
#	region = "${module.vpc-info.region}"
#}

provider "vault" {
  address = "${var.vault_address}"
  #token = "${var.vault_token}"
  #Terraform will attempt to read it from ~/.vault-token (where the vault command stores its current token)
  max_lease_ttl_seconds = "${var.vault_max_lease_ttl_seconds}"
}
