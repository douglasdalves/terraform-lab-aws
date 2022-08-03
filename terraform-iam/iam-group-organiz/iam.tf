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
  name = "lab-group-terraform"
}

## Policys do grupo
resource "aws_iam_group_policy" "group1_policy" {
  name  = "group1_policy_adminAccess"
  group = aws_iam_group.group1.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Action : "*",
        Resource : "*"
      }
    ]
  })
}


## -------- teste de access_key
resource "aws_iam_access_key" "brand_new_user" {
  user = aws_iam_user.user1.name
}


#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership
#https://stackoverflow.com/questions/59473690/how-to-extract-sensitive-output-variables-in-terraform