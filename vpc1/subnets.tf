resource "aws_subnet" "public" {
  count                   = "${length(split(",", var.azs))}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${element(split(",", var.cidr_public), count.index)}"
  availability_zone       = "${element(split(",", var.azs), count.index)}"
  map_public_ip_on_launch = true

  tags {
    Application           = "REciNK"
    Peer                  = "false"
  }
}

resource "aws_route_table_association" "public" {
  count = "${length(compact(split(",", var.azs)))}"
  subnet_id = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
