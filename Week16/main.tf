provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Please replace this with the actual AMI ID
  instance_type = "t2.micro"
  
  # To attach EBS at launch
  root_block_device {
    volume_size = 8
  }

  # Allow SSH
  key_name               = "your-key-name"
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
}

resource "aws_security_group" "instance_sg" {
  name        = "instance_sg"
  description = "Allow SSH"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EBS Volume
resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"  # The AZ should be the same as the EC2 instance
  size              = 10            # The size of the volume in GiBs

  tags = {
    Name = "ebs-example"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}

# EFS File System
resource "aws_efs_file_system" "example" {
  creation_token = "efs-example"

  tags = {
    Name = "efs-example"
  }
}

# EFS Mount Target (create one per EC2 instance; this can be in a loop or duplicated if needed)
resource "aws_efs_mount_target" "example" {
  file_system_id  = aws_efs_file_system.example.id
  subnet_id       = aws_subnet.example.id
  security_groups = [aws_security_group.efs_sg.id]
}

resource "aws_security_group" "efs_sg" {
  name        = "efs_sg"
  description = "Allow NFS for EFS"
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Subnet for the EFS mount target (this assumes you have an existing VPC; otherwise create a new one)
resource "aws_subnet" "example" {
  vpc_id     = "vpc-xxxxxx"  # Replace with your VPC ID
  cidr_block = "10.0.1.0/24" # Replace with a valid subnet CIDR within your VPC

  tags = {
    Name = "efs-subnet-example"
  }
}

# Output the IDs of the created resources
output "instance_id" {
  value = aws_instance.example.id
}

output "ebs_volume_id" {
  value = aws_ebs_volume.example.id
}

output "efs_file_system_id" {
  value = aws_efs_file_system.example.id
}
