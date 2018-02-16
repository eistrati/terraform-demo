terraform {
  required_version = "0.11.0"

  backend "s3" {
    bucket = "cloudnativeci-metadata"
    key    = "cache/MitocGroup/terraform-demo/iam_demo/roles/clarivate-power-user-role/terraform.tfstate"
    region = "us-east-1"
  }
}