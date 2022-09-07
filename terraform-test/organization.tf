
resource "aws_organizations_policy_attachment" "root1" {
  policy_id = aws_organizations_policy.policy_supportDeny.id
  target_id = var.root_details
}


resource "aws_organizations_policy_attachment" "root" {
  policy_id = aws_organizations_policy.policy_billing.id
  target_id = var.root_details
}