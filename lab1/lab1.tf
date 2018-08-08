provider "aws" {
  access_key = "BLAHBLAH"
  secret_key = "BLAHBLAH"
  region     = "us-east-1"
}

resource "aws_instance" "myexample" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}
