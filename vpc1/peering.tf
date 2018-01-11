data "aws_vpc" "vpc_peer" {
  tags {
    Application             = "REciNK"
    Peer                    = "true"
  }
}

data "aws_route_table" "public" {
  tags {
    Application             = "REciNK"
    Peer                    = "true"
  }
}

resource "aws_vpc_peering_connection" "vpc_peering" {
  auto_accept               = true
  vpc_id                    = "${aws_vpc.vpc.id}"
  peer_vpc_id               = "${data.aws_vpc.vpc_peer.id}"

  tags {
    Application             = "REciNK"
    Environment             = "Terraform"
  }
}

resource "aws_route" "vpc_peering_route" {
  route_table_id            = "${aws_route_table.public.id}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc_peering.id}"
  destination_cidr_block    = "${cidrsubnet(data.aws_vpc.vpc_peer.cidr_block, 4, 1)}"
}

resource "aws_route" "vpc_peering_remote_route" {
  destination_cidr_block    = "${var.cidr}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc_peering.id}"
  route_table_id            = "${data.aws_route_table.public.id}"
}
