resource "aws_security_group" "app" {
  name = "app-security-group"
  vpc_id = var.vpc_id
  depends_on = [ aws_vpc_security_group_egress_rule.dmz_saida ]
}

resource "aws_vpc_security_group_ingress_rule" "app-ssh" {
  security_group_id = aws_security_group.app.id
  from_port = 22
  referenced_security_group_id = aws_security_group.dmz.id
  ip_protocol = "tcp"
  to_port = 22
}

resource "aws_vpc_security_group_ingress_rule" "app-rdp" {
  security_group_id = aws_security_group.app.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 3389
  to_port = 3389
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "app-saida" {
  security_group_id = aws_security_group.app.id
  cidr_ipv4  = "0.0.0.0/0"
  ip_protocol = "-1"
}
