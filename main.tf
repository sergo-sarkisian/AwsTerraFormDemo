provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.creds_file}"
  profile                 = "${var.profile}"
}
resource "aws_instance" "web" {
  ami = "ami-08cec7c429219e339"
  instance_type = "t1.micro"
  tags = {
    Name = "demoinstance"
  }
} 
resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_vpc}"
  instance_tenancy = "default"
  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "subnet1"{
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.cidr_subnet}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.region}"
  tags =  {
    "Type" = "Public subnet"
  }
} 

 


