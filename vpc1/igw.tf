resource "aws_internet_gateway" "igw" {
  vpc_id        = "${aws_vpc.vpc.id}"
    
  tags {
    Application = "REciNK"
    Peer        = "false"
  }
}
