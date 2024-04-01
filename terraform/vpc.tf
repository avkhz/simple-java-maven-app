resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "privte" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "private"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Project VPC IG"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "2nd Route Table"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.rt.id
}
