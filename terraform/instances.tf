resource "aws_instance" "example_server" {
  ami                    = "ami-010b74bc1a8b29122"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["${aws_security_group.terra.id}"]
  key_name               = "key_for_micros"
  subnet_id              = aws_subnet.public.id

  tags = {
    Name = var.instance_name
  }

  user_data = file("install_docker.sh")
}

