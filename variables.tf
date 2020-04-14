variable "region" {
  default = "eu-north-1"
}
variable "creds_file" {
  default = "/home/sergio/.aws/credentials"
}

variable "profile" {
  default = "terraform"
}

variable "cidr_vpc" {
  description = "CIDR block used for the VPC"
  default = "10.1.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR block used for particular subnet inside VPC"
  default = "10.1.0.0/24"
}
