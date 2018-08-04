provider "aws" {
  access_key = "AKIAJOL4TE3308ASDFAFXYAF6WSFA"
  secret_key = "+PCxasdfy346KO4vpTBBguOCDN/8l4IYSn"
  region     = "us-east-1"
} 

resource "aws_instance" "myexample" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}
