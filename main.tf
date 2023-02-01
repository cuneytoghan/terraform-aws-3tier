provider "aws" {
  region = "us-east-1"

}

resource "aws_key_pair" "admin-key3" {
  key_name   = "admin-key3"
  public_key = file("~/.ssh/id_rsa.pub")
}
#comment

