output "security_groups_ids" {
  description = "SGs IDs"
  value = {
    "bd" = aws_security_group.bd.id
    "dmz" = aws_security_group.dmz.id
    "app" = aws_security_group.app.id
  }
 }