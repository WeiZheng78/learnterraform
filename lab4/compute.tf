resource "aws_instance" "web_server" {
  ami           = "${lookup(var.webserver_amis, var.aws_region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_default_subnet.learntf_default_subnet.id}"
  key_name = "${aws_key_pair.deployer-keypair.key_name}"
  vpc_security_group_ids = ["${aws_security_group.web_server_sec_group.id}"]
  depends_on = ["aws_s3_bucket.learntf-bins"]

  connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = "${file("/home/cparent/aws_rsa")}"
  }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "/tmp/bootstrap.sh"
      ]
  }
/*
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "sudo service httpd start",
      "sudo groupadd www",
      "sudo usermod -a -G www ec2-user",
      "sudo usermod -a -G www apache",
      "sudo chown -R apache:www /var/www",
      "sudo chmod 770 -R /var/www"
    ]

  } */

  provisioner "file" {
    source      = "learntf.index.html"
    destination = "/var/www/html/index.html"
  }
}

output "webserver_public_ip" {
  value = "${aws_instance.web_server.public_ip}"
}
