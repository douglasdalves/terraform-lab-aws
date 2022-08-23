## ----------------------------------------------------------##
## Polices do organization
## ----------------------------------------------------------##

# Compass-deny-billing

resource "aws_organizations_policy" "policy_billing" {
  name        = "Compass-deny-billing"
  description = "Policy que bloqueia o acesso ao billing pelo cliente."
  tags = {
    Environment = "Payer-ECAM-Partnet-led"
    ManagedBy   = "Terraform"
    Owner       = "Compass-cloud-n1"
  }

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
  tags = {
    Environment = "Payer-ECAM-Partnet-led"
    ManagedBy   = "Terraform"
    Owner       = "Compass-cloud-n1"
  }

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
  tags = {
    Environment = "Payer-ECAM-Partnet-led"
    ManagedBy   = "Terraform"
    Owner       = "Compass-cloud-n1"
  }

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

# SCPCompassoUOL-Lendico-DenyAccessByip
#------------------------------------------------

resource "aws_organizations_policy" "policy_DenyAccessByip" {
  name        = "SCPCompassoUOL-Lendico-DenyAccessByip"
  description = "Permite o acesso para a conta de apenas os ips do cliente Lendico"
  tags = {
    Environment = "Payer-ECAM-Partnet-led"
    ManagedBy   = "Terraform"
    Owner       = "Compass-cloud-n1"
  }

  content = <<CONTENT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Statement2",
      "Effect": "Deny",
      "Action": [
        "*"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "NotIpAddress": {
          "aws:SourceIp": [
            "179.191.73.115/32",
            "177.69.75.25/32"
          ]
        },
        "ArnNotEquals": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoSuporte_*",
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoCloudTeam_*",
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoAdmins_*",
            "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_CompassoNetwork_*",
            "arn:aws:iam::*:role/uoldiveo-mgmt-cost",
            "arn:aws:iam::*:role/CrossAccountAdmin"
          ]
        },
        "ForAnyValue:StringNotLike": {
          "aws:SourceVpc": [
            "vpc-0617b9535b7b831cf",
            "vpc-061b887fb9eaa59f2",
            "vpc-0eff3a09bc98b6d92",
            "vpc-508e0136",
            "vpc-5f6e603a",
            "vpc-8547b2fe",
            "vpc-a273eac7"
          ]
        }
      }
    }
  ]
}
CONTENT
}