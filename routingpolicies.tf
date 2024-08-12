resource "aws_route_table" "automateit-public-rt" {
  vpc_id = aws_vpc.automateit-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table" "automateit-private-rt" {
  vpc_id = aws_vpc.automateit-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.automateit-ngw.id
  }

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

resource "aws_route_table_association" "terraform-ra-1" {
  subnet_id      = aws_subnet.automateit-public-01.id
  route_table_id = aws_route_table.automateit-public-rt.id
}

resource "aws_route_table_association" "terraform-ra-2" {
  subnet_id      = aws_subnet.automateit-public-02.id
  route_table_id = aws_route_table.automateit-public-rt.id
}

resource "aws_route_table_association" "terraform-ra-3" {
  subnet_id      = aws_subnet.automateit-public-03.id
  route_table_id = aws_route_table.automateit-public-rt.id
}


resource "aws_route_table_association" "terraform-ra-4" {
  subnet_id      = aws_subnet.automateit-pri-01.id
  route_table_id = aws_route_table.automateit-private-rt.id
}

resource "aws_route_table_association" "terraform-ra-5" {
  subnet_id      = aws_subnet.automateit-pri-02.id
  route_table_id = aws_route_table.automateit-private-rt.id
}

resource "aws_route_table_association" "terraform-ra-6" {
  subnet_id      = aws_subnet.automateit-pri-03.id
  route_table_id = aws_route_table.automateit-private-rt.id
}
