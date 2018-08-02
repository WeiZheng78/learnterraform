resource "aws_instance" "web_server" {
  ami           = "${lookup(var.webserver_amis, var.aws_region)}"
  instance_type = "t2.micro"
}

output "webserver_public_ip" {
  value = "${aws_instance.web_server.public_ip}"
}
