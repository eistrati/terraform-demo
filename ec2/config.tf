terraform {
  required_version = "0.11.0"

  backend "s3" {
    bucket = "cnci-metadata"
    key    = "cache/MitocGroup/terraform-demo/ec2/terraform.tfstate"
    region = "us-east-1"
  }
}
