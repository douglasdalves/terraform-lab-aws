# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
  region  = "us-east-2"
}
# Maquina ubuntu da aws
resource "aws_instance" "dev" {
    count = 3
    ami = "ami-0bbe28eb2173f6167"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev${count.index}"
    }
}
