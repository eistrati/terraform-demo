module "create_role_account_00" {
  source    = "./role"
  providers = {
    "aws" = "aws.account_00"
  }

  provider                 = "account_00"
  role_name                = "${var.role_name}"
  policy_name              = "${var.policy_name}"
}

module "create_role_account_01" {
  source    = "./role"
  providers = {
    "aws" = "aws.account_01"
  }

  provider                 = "account_01"
  role_name                = "${var.role_name}"
  policy_name              = "${var.policy_name}"
}

module "create_role_account_02" {
  source    = "./role"
  providers = {
    "aws" = "aws.account_02"
  }

  provider                 = "account_02"
  role_name                = "${var.role_name}"
  policy_name              = "${var.policy_name}"
}