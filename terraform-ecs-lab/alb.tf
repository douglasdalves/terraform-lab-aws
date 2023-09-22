# resource "aws_lb" "front_end" {
#   name               = "alb-lab"
#   internal           = false
#   load_balancer_type = "application"
#   #security_groups    = [aws_security_group.lb_sg.id]
#   subnets            = [for subnet in aws_subnet.this : subnet.id]

#   tags = {
#     Environment = "lab-hml"
#   }
# }

# resource "aws_lb_target_group" "front_end" {
#   name        = "alb-lab-tg"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "ip"
#   vpc_id      = "${aws_vpc.this.id}"
# }

# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.front_end.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.front_end.arn
#   }
# }