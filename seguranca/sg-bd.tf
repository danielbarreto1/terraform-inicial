resource "aws_security_group" "bd" {
  name = "bd-security-group"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "bd-linux" {
  security_group_id = aws_security_group.bd.id
  referenced_security_group_id = aws_security_group.app.id
  from_port = 12555
  ip_protocol = "tcp"
  to_port = 12555
}

resource "aws_vpc_security_group_ingress_rule" "bd-linux-ssh" {
  security_group_id = aws_security_group.bd.id
  referenced_security_group_id = aws_security_group.app.id
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22
}

resource "aws_vpc_security_group_egress_rule" "bd-saida" {
  security_group_id = aws_security_group.bd.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}