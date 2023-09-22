resource "aws_ecs_cluster" "clt" {
  name = "clt-ecs-fargate"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}