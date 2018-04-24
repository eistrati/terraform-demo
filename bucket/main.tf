resource "aws_s3_bucket" "b" {
  bucket    = "aws-s3-bucket-as-website-for-terraform-demo"
  acl       = "public-read"
  provider  = "aws.demo_account"


  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
