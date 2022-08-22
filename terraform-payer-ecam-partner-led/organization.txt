resource "aws_organizations_organization" "org" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
  ]

  feature_set = "ALL"
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization