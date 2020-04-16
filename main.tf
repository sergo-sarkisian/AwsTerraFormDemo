provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.creds_file}"
  profile                 = "${var.profile}"
}
resource "aws_instance" "web" {
  ami = "ami-017ad30b324faed9b"
  instance_type = "t3.micro"
  subnet_id = "${aws_subnet.subnet1.id}"
  key_name = "webkeypairs"
  private_ip = "${var.webnodeprivip}"
  vpc_security_group_ids = [ aws_security_group.sec_group_ssh.id , aws_security_group.sec_group_https.id , aws_security_group.sec_group_http.id ] 
  tags = {
    Name = "demoinstanceweb"
  }
} 
resource "aws_instance" "db" {
  ami = "ami-017ad30b324faed9b"
  instance_type = "t3.micro"
  key_name = "dbkeypairs"
  private_ip = "${var.dbprivip}"
  subnet_id = "${aws_subnet.subnet1.id}"
  vpc_security_group_ids = [ aws_security_group.sec_group_ssh.id , aws_security_group.sec_group_mysql.id ]
  tags = {
    Name = "demoinstancedb"
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
  availability_zone = "${var.availability_zone}"
  tags =  {
    "Type" = "Public subnet"
  }
} 

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

}

resource "aws_route_table" "public-subnet_route_table" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags =  {
        Name = "Public Subnet  Table for Route"
    }
}

resource "aws_route_table_association" "vpc_public" {
    subnet_id = "${aws_subnet.subnet1.id}"
    route_table_id = "${aws_route_table.public-subnet_route_table.id}"
}
