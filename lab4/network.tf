# Create a reference to the default AWS subnet
resource "aws_default_subnet" "learntf_default_subnet" {
  availability_zone = "us-east-1a"
}

resource "aws_security_group" "web_server_sec_group" {
  name        = "web server security group"
#  vpc_id      = "${aws_default_vpc.id}"

  # allow ssh
  ingress {
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow tcp on port 80
  ingress {
    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
