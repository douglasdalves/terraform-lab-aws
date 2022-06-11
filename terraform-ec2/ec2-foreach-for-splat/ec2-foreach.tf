resource "aws_instance" "this" {
  for_each = {
    web = {
      name = "Web server"
      type = "t2.micro"
    }
    ci_cd = {
      name = "CI/CD server"
      type = "t2.micro"
    }
  }

  ami           = var.instance_ami
  instance_type = lookup(each.value, "type", null)

  tags = {
    Project = "Curso AWS-Terraform udemy"
    Name    = "${each.key}: ${lookup(each.value, "name", null)}"
    Lesson  = "Foreach, For, Splat"
  }
}
