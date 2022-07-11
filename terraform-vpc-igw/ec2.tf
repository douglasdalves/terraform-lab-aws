#--------------------------------------------
# EC2 > Launch templates
#--------------------------------------------

resource "aws_launch_template" "this" {
  name_prefix   = "terraform-lab"
  image_id      = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.instance_key_name
  user_data     = filebase64("ec2_user_data_yum.sh")

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.autoscaling.id]
  }
}

#--------------------------------------------
# EC2 > Auto Scaling
#--------------------------------------------
resource "aws_autoscaling_group" "this" {
  name                      = "terraform-autoscaling"
  vpc_zone_identifier       = [aws_subnet.this["pub_a"].id, aws_subnet.this["pub_b"].id]
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 240
  health_check_type         = "ELB"
  force_delete              = true
  target_group_arns         = [aws_lb_target_group.this.id]

  launch_template {
    id      = aws_launch_template.this.id
    version = aws_launch_template.this.latest_version
  }
}

resource "aws_autoscaling_policy" "scaleup" {
  name                   = "Scale Up"
  autoscaling_group_name = aws_autoscaling_group.this.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "180"
  policy_type            = "SimpleScaling"
}

resource "aws_autoscaling_policy" "scaledown" {
  name                   = "Scale Down"
  autoscaling_group_name = aws_autoscaling_group.this.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "180"
  policy_type            = "SimpleScaling"
}

#--------------------------------------------
# EC2 > jenkins
#--------------------------------------------
resource "aws_instance" "jenkins" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.jenkins.id]
  subnet_id              = aws_subnet.this["pvt_b"].id
  availability_zone      = "${var.aws_region}b"

  tags = merge(local.common_tags, { Name = "Jenkins Machine" })
}