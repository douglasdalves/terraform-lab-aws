resource "aws_iam_user_group_membership" "example2" {
  user = aws_iam_user.user1.name

  groups = [
    aws_iam_group.group1.name,
  ]
}

resource "aws_iam_user" "user1" {
  name = "rundeck.system"
}

resource "aws_iam_group" "group1" {
  name = "lab-terraform"
}

## -------- teste de access_key
resource "aws_iam_access_key" "brand_new_user" {
  user = aws_iam_user.user1.name
}

output "brand_new_user_id" {
  value = aws_iam_access_key.brand_new_user.id
}

data "template_file" "secret" {
  template = aws_iam_access_key.brand_new_user.secret
}

output "brand_new_user_secret" {
  value     = data.template_file.secret.rendered
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership
#https://stackoverflow.com/questions/59473690/how-to-extract-sensitive-output-variables-in-terraform