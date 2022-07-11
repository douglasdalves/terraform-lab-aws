output "id" {
  value = aws_instance.web.id
}

output "ami" {
  value = aws_instance.web.ami
}

output "arn" {
  value = aws_instance.web.arn
}

output "instance_public_ips" {
  value = aws_instance.web.*.public_ip
}