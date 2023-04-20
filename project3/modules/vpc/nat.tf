resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "terraform-elastic-ip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = element(aws_subnet.public-subnets.*.id, 0)

  tags = {
    Name = "terraform-nat"
  }

  depends_on = [aws_internet_gateway.default]
}
