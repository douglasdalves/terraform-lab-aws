## ----------------------------------------------------------##
## Role de acessos
## ----------------------------------------------------------##


# Role CrossAccountAdmin

resource "aws_iam_role" "role_AccountAdmin" {
  name = "CrossAccountAdmin"
  tags = var.registro

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::766581111222:root"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "policy_AccountAdmin" {
  name        = "policy_AdministratorAccess"
  description = "Provides full access to AWS services and resources."

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_AccountAdmin" {
  role       = aws_iam_role.role_AccountAdmin.name
  policy_arn = aws_iam_policy.policy_AccountAdmin.arn
}


# Role CrossAccountSignin

resource "aws_iam_role" "role_AccountSignin" {
  name = "CrossAccountSignin"
  tags = var.registro

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::766581111222:root"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}


# resource "aws_iam_role" "policy_ReadOnlyAccess" {
#   name        = "policy_ReadOnlyAccess"
#   description = "Provides read-only access to AWS services and resources."
#   tags = {
#     Environment = "Payer-ECAM-Partnet-led"
#     ManagedBy   = "Terraform"
#     Owner       = "Compass-cloud-n1"
#   }

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         "Effect" : "Allow",
#         "Principal" : {
#           "AWS" : "arn:aws:iam::766581111222:root"
#         },
#         "Action" : "sts:AssumeRole"
#         Path : "/"
#         ManagedPolicyArns : [
#           "arn:aws:iam::aws:policy/ReadOnlyAccess",#
#         ],
#       },
#     ]
#   })
# }


resource "aws_iam_policy" "policy_AWSSupportAccess" {
  name        = "policy_AWSSupportAccess"
  description = "Allows users to access the AWS Support Center."

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "support:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "attach_AccountSignin2" {
  role       = aws_iam_role.role_AccountSignin.name
  policy_arn = aws_iam_policy.policy_AWSSupportAccess.arn
}

# Role CrossAccountBilling

resource "aws_iam_role" "role_Billing" {
  name = "CrossAccountBilling"
  tags = var.registro

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::766581111222:root"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "policy_Billing" {
  name        = "policy_Billing"
  description = "Grants permissions for billing and cost management. This includes viewing account usage and viewing and modifying budgets and payment methods."

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "aws-portal:*Billing",
                "aws-portal:*Usage",
                "aws-portal:*PaymentMethods",
                "budgets:ViewBudget",
                "budgets:ModifyBudget",
                "ce:UpdatePreferences",
                "ce:CreateReport",
                "ce:UpdateReport",
                "ce:DeleteReport",
                "ce:CreateNotificationSubscription",
                "ce:UpdateNotificationSubscription",
                "ce:DeleteNotificationSubscription",
                "cur:DescribeReportDefinitions",
                "cur:PutReportDefinition",
                "cur:ModifyReportDefinition",
                "cur:DeleteReportDefinition",
                "purchase-orders:*PurchaseOrders"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_Billing" {
  role       = aws_iam_role.role_Billing.name
  policy_arn = aws_iam_policy.policy_Billing.arn
}