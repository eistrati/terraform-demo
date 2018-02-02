# Define list of variables to be used in main.tf

variable "region" {
  type = "string"
}

variable "access_key" {
  type = "string"
}

variable "secret_key" {
  type = "string"
}

variable "vpc_id" {
  type = "string"
}

variable "subnet_id" {
  type = "string"
}

variable "availability_zone" {
  type = "string"
}

variable "instance_type" {
  type = "string"
}

variable "security_groups" {
  type = "list"
}

variable "ami_id" {
  type = "string"
}

variable "key_name" {
  type = "string"
}
