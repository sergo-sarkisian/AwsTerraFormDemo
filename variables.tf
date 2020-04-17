variable "region" {
  default = "eu-north-1"
}
variable "creds_file" {
  default = "path to creds_file"
}

variable "profile" {
  default = "terraform"
}

variable "cidr_vpc" {
  description = "CIDR block used for the VPC"
  default = "10.10.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR block used for particular subnet inside VPC"
  default = "10.10.0.0/24"
}
variable "availability_zone" {
  default = "eu-north-1a"
}
variable "dbprivip" {
  default = "10.10.0.101"
}
variable "webnodeprivip" {
  default = "10.10.0.102"
}

