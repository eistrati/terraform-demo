variable "region" {
  type = "string"
  default = "us-west-2"
}

variable "access_key" {
  type = "string"
}

variable "secret_key" {
  type = "string"
}

variable "db_subnet_group_name" {
  type = "string"
  default = "default"
}

variable "db_identifiers" {
  type = "list"
  default = ["wos-caesar"]
}

variable "new_db_identifiers" {
  type = "list"
  default = ["wos-caesar-new"]
}

variable "db_names" {
  type = "list"
  default = ["wos_caesar"]
}

variable "instances_class" {
  type = "list"
  default = ["db.t2.micro"]
}

variable "multi_az" {
  type = "string"
  default = false
}

variable "vpc_security_group_ids" {
  type = "list"
  default = ["sg-25442640"]
}

variable "skip_final_snapshot" {
  type = "string"
  default = true
}
