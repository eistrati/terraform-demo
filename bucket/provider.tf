provider "aws" {
  alias                 = "profile_credentials"
  region                = "${var.region}"
  profile               = "${var.profile}"
  allowed_account_ids   = ["${var.account_id}"]
}

provider "aws" {
  alias                 = "env_credentials"
  region                = "${var.region}"
}
