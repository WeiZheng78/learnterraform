resource "aws_vpc" "learntf_vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "web_subnet" {
  vpc_id = "${aws_vpc.learntf_vpc.id}"
  cidr_block = "10.0.0.0/28"
  availability_zone = "us-east-1a"
}
