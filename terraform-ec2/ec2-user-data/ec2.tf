
#--------------------------------------------
# EC2 > web
#--------------------------------------------
resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.instance_key_name

  subnet_id                   = aws_subnet.this["pub_a"].id
  availability_zone           = "${var.aws_region}a"
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo service httpd start
sudo chkconfig httpd on
echo "Hello from Terraform" > /var/www/html/index.html
sudo amazon-linux-extras install epel -y
sudo yum install stress -y
EOF

  tags = merge(local.common_tags, { Name = "Machine-user" })
}