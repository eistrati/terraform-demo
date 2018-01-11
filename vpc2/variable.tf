variable "access_key" {
  type        = "string"
}

variable "secret_key" {
  type        = "string"
}

variable "region" {
  type        = "string"
  default     = "us-east-1"
}

variable "cidr" {
  type        = "string"
  default     = "10.3.0.0/16"
}

variable "cidr_public" {
  type        = "string"
  default     = "10.3.0.0/24,10.3.1.0/24,10.3.2.0/24"
}

variable "azs" {
  type        = "string"
  default     = "us-west-1a,us-west-1b"
}

variable "enable_dns_hostnames" {
  type        = "string"
  default     = true
}

variable "enable_dns_support" {
  type        = "string"
  default     = true
}

variable "public_propagating_vgws" {
  type        = "string"
  default     = ""
}
