variable "region" {
  default = "us-west-2"
}

variable "access_key" {}

variable "secret_key" {}

variable "vpc_id" {
  default = "vpc-a0c91fc5"
}

variable "subnet_id" {
  default = "subnet-00319365"
}

variable "availability_zone" {
  default = "us-west-2a"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "security_groups" {
  default = [ "sg-25442640" ]
}

variable "ami_id" {
  default = "ami-32d8124a"
}

variable "key_name" {
  default = "developer"
}
