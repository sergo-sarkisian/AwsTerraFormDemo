resource "aws_security_group" "sec_group" {
  name = "sec_group"
  vpc_id = "${aws_vpc.main.id}" 
ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "sec_group_https" {
  name = "sec_group_https"
  vpc_id = "${aws_vpc.main.id}"
ingress {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 
}
resource "aws_security_group" "sec_group_http" {
  name = "sec_group_http"
  vpc_id = "${aws_vpc.main.id}"
ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "sec_group_mysql" {
  name = "sec_group_mysql"
  vpc_id = "${aws_vpc.main.id}"
ingress {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = [var.cidr_subnet]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
