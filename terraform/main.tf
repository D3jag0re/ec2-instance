# Set the variable value in *.tfvars file for local run
variable "do_token" {
  default = "tmp"
}

# Set up the variable value in *.tfvars file for local run
variable "public_key" {}

# Create a Security Group to allow SSH access
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  # Inbound Rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from any IP (can change for better security)
  }

  # Outbound Rule - Allow all traffic out
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_sg"
  }
}

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
  key_name                    = aws_key_pair.ec2key.key_name
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]


  tags = {
    Name = "web-ec2"
  }
}

# Capture outputs of droplet
output "ec2_info" {
  value = {
    id        = aws_instance.web-ec2.id
    public_ip = aws_instance.web-ec2.public_ip
  }
}