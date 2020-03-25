resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.ilead-vpc.id

    tags = {
        Name = "internet_gateway"
    }  
}
resource "aws_eip" "nat-eip" {
  vpc = true
}
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.nat-eip.id}"
  subnet_id = "${aws_subnet.Public_Subnet_1.id}"
  depends_on = ["aws_internet_gateway.internet_gateway"]
}

resource "aws_route_table" "Public_Subnet_RT" {
  vpc_id = "${aws_vpc.ilead-vpc.id}"

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }
  tags = {
      Name = "Public_Subnet_RT"
  }
}

resource "aws_route_table" "Private_Subnet_RT" {
  vpc_id = "${aws_vpc.ilead-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gateway.id}"
  }
  tags = {
    Name = "Private_Subnet_RT"
  }
}

resource "aws_route_table_association" "RTA1" {
  subnet_id = "${aws_subnet.Public_Subnet_1.id}"
  route_table_id = "${aws_route_table.Public_Subnet_RT.id}"
}

resource "aws_route_table_association" "RTA2" {
  subnet_id = "${aws_subnet.Public_Subnet_2.id}"
  route_table_id = "${aws_route_table.Public_Subnet_RT.id}"
}
resource "aws_route_table_association" "RTA3" {
  subnet_id = "${aws_subnet.Private_Subnet_1.id}"
  route_table_id = "${aws_route_table.Private_Subnet_RT.id}"
}
resource "aws_route_table_association" "RTA4" {
  subnet_id = "${aws_subnet.Private_Subnet_2.id}"
  route_table_id = "${aws_route_table.Private_Subnet_RT.id}"
}