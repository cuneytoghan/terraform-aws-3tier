resource "aws_instance" "myinstance" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t3.micro"

  key_name = "admin-key3"


resource "aws_instance" "myinstance" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t3.micro"

  key_name = "admin-key3"


  security_groups = ["ssh-sg", "http-sg"]

  root_block_device {
    volume_size = 20
  } 
  tags = {
    Name = "myinstance"
  }
}