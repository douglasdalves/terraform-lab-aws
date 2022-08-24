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

data "aws_iam_policy" "policy_AccountAdmin" {
  name = "AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "attach_AccountAdmin" {
  role       = aws_iam_role.role_AccountAdmin.name
  policy_arn = data.aws_iam_policy.policy_AccountAdmin.arn
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


#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy
data "aws_iam_policy" "policy_ReadOnlyAccess" {
  name = "ReadOnlyAccess"
}

data "aws_iam_policy" "policy_AWSSupportAccess" {
  name = "AWSSupportAccess"
}

resource "aws_iam_role_policy_attachment" "attach_AccountSignin2" {
  role       = aws_iam_role.role_AccountSignin.name
  policy_arn = data.aws_iam_policy.policy_AWSSupportAccess.arn
}

resource "aws_iam_role_policy_attachment" "attach_AccountSignin1" {
  role       = aws_iam_role.role_AccountSignin.name
  policy_arn = data.aws_iam_policy.policy_ReadOnlyAccess.arn
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

data "aws_iam_policy" "policy_Billing" {
  name = "Billing"
}

resource "aws_iam_role_policy_attachment" "attach_Billing" {
  role       = aws_iam_role.role_Billing.name
  policy_arn = data.aws_iam_policy.policy_Billing.arn
}
