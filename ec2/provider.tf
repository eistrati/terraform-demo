provider "aws" {
  version = "~> 0.1"
  #shared_credentials_file = "~/.aws/credentials"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
