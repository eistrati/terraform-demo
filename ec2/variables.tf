variable "region" {
  default = "us-west-2"
}

variable "vpc_id" {
  default = "vpc-80f8c5e6"
}

variable "subnet_id" {
  default = "subnet-feb8dcb6"
}

variable "availability_zone" {
  default = "us-west-2a"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "security_groups" {
  default = [ "sg-c84b75b5" ]
}

variable "ami_id" {
  default = "ami-32d8124a"
}

variable "key_name" {
  default = "developer"
}
