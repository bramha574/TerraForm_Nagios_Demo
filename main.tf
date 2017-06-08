provider "aws" {
  access_key = "AKIAIJ7PIU25SBPBKU5Q"
  secret_key = "kUIPHi2Oo9+sDJ1tttmb29dx2igvS3cFlR7tRj2t"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-2d39803a"
  instance_type = "t2.micro"
  tags {
    Name = "test-bramha-terraform-demo"
  }
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
}

resource "aws_security_group" "instance" {
  name = "bramha-test-sg-example"
  ingress {
    from_port = "${var.server_port}"
    to_port = "${var.server_port}"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
