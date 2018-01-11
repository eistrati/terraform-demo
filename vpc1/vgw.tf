resource "aws_vpn_gateway" "vgw" {
  vpc_id        = "${aws_vpc.vpc.id}"
  tags {
    Application = "REciNK"
    Peer        = "true"
  }
}
