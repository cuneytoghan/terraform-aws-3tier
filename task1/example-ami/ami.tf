data "aws_ami" "amazon_ami" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "myinstance1" {
  ami           = data.aws_ami.amazon_ami.id
  instance_type = "t2.micro"
  
  key_name = aws_key_pair.bastion_key.key_name
}

resource "aws_instance" "myinstance2" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.bastion_key.key_name
}

output "amazon" {
  value       = data.aws_ami.amazon_ami.id
  description = "Amazon Linux AMI"
}

output "ubuntu" {
  value       = data.aws_ami.ubuntu_ami.id
  description = "Amazon Linux AMI"
}