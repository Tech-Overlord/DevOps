variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

provider "aws" {
  region = "us-east-1"
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
}

resource "aws_instance" "web" {
  ami = "ami-749bc50b"
  key_name = "my_key"
  instance_type = "t2.micro"
  security_groups = ["sg-12345678"]
  tags {
    Name = "JenkinsMasterNode"
  }
}