resource "aws_ecs_service" "lab-ecs" {
  name            = "nginx"
  cluster         = aws_ecs_cluster.clt.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.front_end.arn
    container_name   = "nginx"
    container_port   = 80
  }
}


# Creating an ECS task definition
resource "aws_ecs_task_definition" "task" {
  family                   = "service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE", "EC2"]
  cpu                      = 512
  memory                   = 2048

  container_definitions = jsonencode([
    {
      name: "nginx",
      image: "nginx:1.23.1",
      cpu: 512,
      memory: 2048,
      essential: true,
      portMappings: [
        {
          containerPort: 80,
          hostPort: 80,
        },
      ],
    },
  ])
}