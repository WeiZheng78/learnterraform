# Create a reference to the default AWS subnet
resource "aws_default_subnet" "learntf_default_subnet" {
  availability_zone = "us-east-1a"
}
