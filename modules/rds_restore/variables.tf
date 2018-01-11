variable "region" {
  type = "string"
}

variable "access_key" {
  type = "string"
}

variable "secret_key" {
  type = "string"
}

variable "db_subnet_group_name" {
  type = "string"
}

variable "db_identifiers" {
  type = "list"
}

variable "new_db_identifiers" {
  type = "list"
}

variable "db_names" {
  type = "list"
}

variable "instances_class" {
  type = "list"
}

variable "multi_az" {
  type = "string"
}

variable "vpc_security_group_ids" {
  type = "list"
}

variable "skip_final_snapshot" {
  type = "string"
}
