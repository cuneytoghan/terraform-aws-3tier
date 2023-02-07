resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "myinstance1" {
  ami             = "ami-0b5eea76982371e91"
  instance_type   = "t2.micro"
  security_groups = ["ssh-sg", "http-sg"]

 # provisioner "local-exec" {
   # command = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i \"${self.public_ip},\" playbook.yml -u ec2-user -b"
 # }

  key_name = "bastion-key"
}
resource "null_resource" "html" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = aws_instance.myinstance1.public_ip
    }
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo touch /var/www/html/index.html",
      "sudo chmod 777 /var/www/html/index.html",
      "hostname > /var/www/html/index.html"
    ]
  }
}