terraform {
  required_version = "0.11.0"

  backend "s3" {
    bucket = "cloudnativeci-metadata"
    key    = "cache/MitocGroup/terraform-demo/iam/roles/admin-role/terraform.tfstate"
    region = "us-east-1"
  }
}