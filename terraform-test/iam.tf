# Role CrossAccountAdmin

resource "aws_iam_role" "role_AccountAdmin" {
  name = "CrossAccountAdmin"
  tags = merge(var.registro, local.common_tags)
    lifecycle {
    ignore_changes = [
      tags["CreatedDate"]
    ]
  }

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