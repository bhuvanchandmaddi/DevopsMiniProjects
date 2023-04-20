resource "aws_subnet" "public-subnets" {
    count = "${length(var.public_cidrs)}"
    vpc_id = "${aws_vpc.default.id}"
    availability_zone = "${element(var.azs, count.index)}"
    cidr_block = "${element(var.public_cidrs, count.index)}"
    tags = {
        Name = "${var.vpc_name}-Public-Subnet-${count.index+1}"
    }
}

resource "aws_subnet" "private-subnets" {
    count = "${length(var.private_cidrs)}"
    vpc_id = "${aws_vpc.default.id}"
    availability_zone = "${element(var.azs, count.index)}"
    cidr_block = "${element(var.private_cidrs, count.index)}"
    tags = {
        Name = "${var.vpc_name}-Private-Subnet-${count.index+1}"
    }
}
