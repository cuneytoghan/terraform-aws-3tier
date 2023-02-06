
resource "aws_key_pair" "admin_key" {
  key_name   = "admin_key"
  public_key = file("~/.ssh/id_rsa.pub")


}

resource "aws_instance" "web1" {
  ami           = "ami-06e85d4c3149db26a"
  instance_type = "t2.micro"
  key_name      = "admin_key"

  depends_on = [aws_key_pair.admin_key, aws_db_instance.my_db]
  tags = merge(
    var.common_tags,
    {
      Name = "web1"
    },
  )

}