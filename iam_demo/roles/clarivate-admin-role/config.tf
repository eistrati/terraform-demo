terraform {
  required_version = "0.11.0"

  backend "s3" {
    bucket = "cloudnativeci-metadata"
    key    = "cache/MitocGroup/terraform-demo/iam_demo/roles/clarivate-admin-role/terraform.tfstate"
    region = "us-east-1"
  }
}