# Set the variable value in *.tfvars file for local run
variable "do_token" {}

# Set up the variable value in *.tfvars file for local run
variable "public_key" {}

# SSH Key 
resource "aws_key_pair" "ec2key" {
  key_name   = "ec2-key"
  public_key = var.public_key
}

# ami
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Create EC2 Instance 

resource "aws_instance" "web-ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ec2key

  tags = {
    Name = "web-ec2"
  }
}