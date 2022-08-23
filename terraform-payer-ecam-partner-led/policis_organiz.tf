## ----------------------------------------------------------##
## Polices do organization
## ----------------------------------------------------------##

# Compass-deny-billing

resource "aws_organizations_policy" "policy_billing" {
  name        = "Compass-deny-billing"
  description = "Policy que bloqueia o acesso ao billing pelo cliente."
  tags = var.registro

  content = <<CONTENT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "denybilling",
      "Effect": "Deny",
      "Action": [
        "aws-portal:*",
        "cur:*",
        "ce:*",
        "budgets:*",
        "pricing:*"
      ],
      "Resource": "*",
      "Condition": {
        "ArnNotLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoCloudTeam_*",
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoAdmins_*"
          ]
        }
      }
    }
  ]
}
CONTENT
}

# SCPCompassoUOL-SupportDeny

resource "aws_organizations_policy" "policy_supportDeny" {
  name        = "SCPCompassoUOL-SupportDeny"
  description = "SCP Compasso UOL - Support Deny"
  tags = var.registro

  content = <<CONTENT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Deny",
      "Action": [
        "support:*",
        "ec2:ReportInstanceStatus"
      ],
      "Resource": "*",
      "Condition": {
        "ArnNotEquals": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoSuporte_*",
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoCloudTeam_*",
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoAdmins_*",
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoNetwork_*",
            "arn:aws:iam::*:role/CrossAccountAdmin"
          ]
        }
      }
    }
  ]
}
CONTENT
}


# SCPCompassoUOL-ProtectAWSSSO

resource "aws_organizations_policy" "policy_ProtectAWSSSO" {
  name        = "SCPCompassoUOL-ProtectAWSSSO"
  description = "SCP Compasso UOL - Protect Settings on AWS SSO"
  tags = var.registro

  content = <<CONTENT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ProtectSSO",
      "Effect": "Deny",
      "Action": [
        "sso:*",
        "sso-directory:*"
      ],
      "Resource": "*",
      "Condition": {
        "ArnNotLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoCloudTeam_*",
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoAdmins_*"
          ]
        }
      }
    }
  ]
}
CONTENT
}
