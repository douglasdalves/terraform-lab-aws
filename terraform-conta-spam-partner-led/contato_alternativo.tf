
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_alternate_contact

resource "aws_account_alternate_contact" "billing" {

  alternate_contact_type = "BILLING"

  name          = "Faturamento UOLDIVEO"
  title         = "AWS-Faturamento-Abuse"
  email_address = "l-aws-faturamento@uoldiveo.com"
  phone_number  = "+551130926695"
}


resource "aws_account_alternate_contact" "operations" {

  alternate_contact_type = "OPERATIONS"

  name          = "Operação UOLDIVEO"
  title         = "AWS-Operação-Abuse"
  email_address = "l-aws-operacao@uoldiveo.com"
  phone_number  = "+551130389872"
}


resource "aws_account_alternate_contact" "securty" {

  alternate_contact_type = "SECURITY"

  name          = "Abuse UOL"
  title         = "AWS-Seguranca-Abuse"
  email_address = "l-aws-seguranca@uoldiveo.com"
  phone_number  = "+551130388674"
}