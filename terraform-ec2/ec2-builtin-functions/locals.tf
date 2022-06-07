locals {
  instance_number = lookup(var.instance_number, var.env)

  common_tags = {
    "Owner" = "Douglas santos"
    "Year"  = "2022"
  }
}
