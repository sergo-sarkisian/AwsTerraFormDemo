provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.creds_file}"
  profile                 = "${var.profile}"
}
resource "aws_instance" "web" {
  ami = "ami-08cec7c429219e339"
  instance_type = "t1.micro"
  tags {
    Name = "demoinstance"
  }
}

