resource "aws_network_interface" "network_interface_app" {
  subnet_id = var.public_subnet_ids["app"]
  private_ips     = ["10.0.0.68"]
  security_groups = [var.security_group_id["app"]]

  attachment {
    instance     = aws_instance.ec2_3.id
    device_index = 1
  }
}


resource "aws_instance" "ec2_3"{
    ami = "ami-0f9c6511313201a5b"
    instance_type = var.instance_type
    subnet_id = var.public_subnet_ids["app"]
    vpc_security_group_ids = [var.security_group_id["app"]]
    tags = {
        Name = "ec2-app"
    }

      metadata_options {
    http_tokens = "required"
    http_endpoint = "enabled"
  }

}