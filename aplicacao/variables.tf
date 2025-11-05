variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "security_group_id" {
  type = map(string)
  description = "SGs IDs"
}

variable "private_subnet_ids" {
  type = map(string)
  description = "Private Subnets"
}

variable "public_subnet_ids" {
  type = map(string)
  description = "Public Subnets"
}