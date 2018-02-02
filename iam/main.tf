resource "aws_iam_role" "terraform_demo" {
  name                  = "terraform_demo"
  force_detach_policies = false
  description           = "test IAM role"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ec2.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}
