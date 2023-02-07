resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "myinstance1" {
  ami             = "ami-0b5eea76982371e91"
  instance_type   = "t2.micro"
  security_groups = ["ssh-sg", "http-sg"]

   provisioner "local-exec" {
    command = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i \"${self.public_ip},\" playbook.yml -u ec2-user -b"
  }

  key_name = "bastion-key"
}