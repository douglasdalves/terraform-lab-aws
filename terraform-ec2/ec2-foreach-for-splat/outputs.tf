output "extensions" {
  value = local.file_extensions
}

# Usando locals
output "extensions_upper" {
  value = local.file_extensions_upper
}

output "instance_arns" {
  value = [for k, v in aws_instance.this : v.arn]
}

# Usando for
output "instance_names" {
  value = { for k, v in aws_instance.this : k => v.tags.Name }
}

# Usando for com locals
output "private_ips" {
  value = [for o in local.ips : o.private]
}

# Splat Expressions
output "public_ips" {
  value = local.ips[*].public
}
