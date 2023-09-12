resource "aws_ecs_cluster" "clt" {
  name = "white-hart"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}