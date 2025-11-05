resource "aws_instance" "ec2_1" {
  ami = "ami-0360c520857e3138f"
  instance_type = var.instance_type
  subnet_id = var.private_subnet_ids["dmz"]
  vpc_security_group_ids = [var.security_group_id["dmz"]]
  tags = {
    Name = "ec2-dmz"
  }
}
