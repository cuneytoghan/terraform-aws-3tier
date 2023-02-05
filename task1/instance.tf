resource "aws_key_pair" "bastion-key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web1" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet1.id
  key_name               = "bastion-key"
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.http_sg.id]
  user_data              = <<-EOF
        #!/bin/bash
        yum install httpd -y
        service httpd start
        chkconfig httpd on
        echo "Hello, world" > /var/www/html/index.html 
        EOF

    tags = merge(
       var.common_tags,
    {
    Name = "web1"
    },
  )

}
resource "aws_instance" "web2" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet2.id
  key_name               = "bastion-key"
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.http_sg.id]
  user_data              = <<-EOF
        #!/bin/bash
        yum install httpd -y
        service httpd start
        chkconfig httpd on
        echo "Hello, world" > /var/www/html/index.html 
        EOF

  tags = merge(
       var.common_tags,
    {
    Name = "web2"
    },
  )
}

resource "aws_instance" "web3" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet3.id
  key_name               = "bastion-key"
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.http_sg.id]
  user_data              = <<-EOF
        #!/bin/bash
        yum install httpd -y
        service httpd start
        chkconfig httpd on
        echo "Hello, world" > /var/www/html/index.html 
        EOF

    tags = merge(
       var.common_tags,
    {
    Name = "web1"
    },
  )
}