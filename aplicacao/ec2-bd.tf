resource "aws_network_interface" "network_interface_bd" {
  subnet_id = var.private_subnet_ids["bd"]
  private_ips     = ["10.0.0.130"]
  security_groups = [var.security_group_id["bd"]]
  attachment {
    instance     = aws_instance.ec2_2.id
    device_index = 1
  }
}

resource "aws_instance" "ec2_2" {
    ami = "ami-0360c520857e3138f"
    instance_type = var.instance_type
    subnet_id = var.private_subnet_ids["bd"]
    vpc_security_group_ids = [var.security_group_id["bd"]]
    tags = {
        Name = "ec2-bd"
    }
    user_data = file("${path.module}/install_python.sh")
}
