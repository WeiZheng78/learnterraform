provider "aws" {
  access_key = "AKIAJOL4TE3XYAF6WSFA"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_instance" "myexample" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}
