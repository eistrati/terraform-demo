resource "aws_route_table" "public" {
  vpc_id                 = "${aws_vpc.vpc.id}"
  propagating_vgws       = ["${compact(split(",", var.public_propagating_vgws))}"]
  
  tags {
    Application          = "REciNK"
    Peer                 = "true"
  }
}

resource "aws_route" "public_internet_gateway" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = "${aws_route_table.public.id}"
  gateway_id             = "${aws_vpn_gateway.vgw.id}"
}
