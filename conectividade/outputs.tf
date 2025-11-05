output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Private subnet IDs"
  value = {
    "app" = aws_subnet.app.id
  }
 }

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value = {
    "bd" = aws_subnet.bd.id
    "dmz" = aws_subnet.dmz.id
  }
 }