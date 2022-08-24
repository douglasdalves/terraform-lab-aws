## ----------------------------------------------------------##
## Configuracões de grupo e user
## ----------------------------------------------------------##
resource "aws_iam_user_group_membership" "group_user" {
  user = aws_iam_user.user.name

  groups = [
    aws_iam_group.group.name,
  ]
}

## ----------------------------------------------------------##
## Policys do grupo
## ----------------------------------------------------------##

resource "aws_iam_group_policy" "policy_admin" {
  name  = "AdministratorAccess"
  group = aws_iam_group.group.name

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


resource "aws_iam_group_policy" "Support_Deny" {
  name  = "SupportDeny"
  group = aws_iam_group.group.name

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        "Action" : [
          "Support:*"
        ],
        "Resource" : "*",
        "Effect" : "Deny"
      }
    ]
  })
}

resource "aws_iam_group_policy" "Policy_Billing" {
  name  = "BillingDenyPolicy"
  group = aws_iam_group.group.name

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        "Action" : [
          "ce:*",
          "aws-portal:*",
          "organizations:*",
          "Support:*",
          "pricing:*",
          "budgets:*",
          "cur:*"
        ],
        "Resource" : "*",
        "Effect" : "Deny"
      }
    ]
  })
}

## ----------------------------------------------------------##
## Dados do iam
## ----------------------------------------------------------##
resource "aws_iam_user" "user" {
  name = "user-compass-config"
  tags = var.registro
}

resource "aws_iam_group" "group" {
  name = "Admin-payer"
}

resource "aws_iam_access_key" "brand_new_user" {
  user = aws_iam_user.user.name
}