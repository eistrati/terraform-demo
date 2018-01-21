terraform {
  required_version = "0.11.0"

  backend "s3" {
    bucket = "travis-metadata"
    key    = "cache/MitocGroup/terraform-demo/ec2/terraform.tfstate"
    region = "us-east-1"
  }
}
