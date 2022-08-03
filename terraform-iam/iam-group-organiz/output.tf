## -------- outputs
output "brand_new_user_id" {
  value = aws_iam_access_key.brand_new_user.id
}

data "template_file" "secret" {
  template = aws_iam_access_key.brand_new_user.secret
}

output "brand_new_user_secret" {
  value = data.template_file.secret.rendered
}