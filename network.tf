resource "aws_vpc" "automateit-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name = "${var.vpc_name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.automateit-vpc.id

  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}



resource "aws_subnet" "automateit-public-01" {
  vpc_id     = aws_vpc.automateit-vpc.id
  cidr_block = var.pub01
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.vpc_name}-public-01"
  }
}

resource "aws_subnet" "automateit-public-02" {
  vpc_id     = aws_vpc.automateit-vpc.id
  cidr_block = var.pub02
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.vpc_name}-public-02"
  }
}

resource "aws_subnet" "automateit-public-03" {
  vpc_id     = aws_vpc.automateit-vpc.id
  cidr_block = var.pub03
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.vpc_name}-public-03"
  }
}


resource "aws_eip" "automateit-eip" {
}

resource "aws_nat_gateway" "automateit-ngw" {
  allocation_id = aws_eip.automateit-eip.id
  subnet_id     = aws_subnet.automateit-public-01.id
  

  tags = {
    Name = "${var.vpc_name}-ngw"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_subnet" "automateit-pri-01" {
  vpc_id     = aws_vpc.automateit-vpc.id
  cidr_block = var.pri01
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.vpc_name}-pri-01"
  }
}

resource "aws_subnet" "automateit-pri-02" {
  vpc_id     = aws_vpc.automateit-vpc.id
  cidr_block = var.pri02
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.vpc_name}-pri-02"
  }
}

resource "aws_subnet" "automateit-pri-03" {
  vpc_id     = aws_vpc.automateit-vpc.id
  cidr_block = var.pri03
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.vpc_name}-pri-03"
  }
}