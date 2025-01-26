resource "aws_ecs_cluster" "main" {
  name = var.ecs_cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.ecs_container_name}"
  retention_in_days = 30

  tags = {
    Owner = var.vpc_owner
  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = var.ecs_task_definition_family
  network_mode             = var.ecs_task_definition_network_mode
  requires_compatibilities = var.ecs_task_definition_requires_compatibilities
  cpu                      = var.ecs_task_definition_cpu
  memory                   = var.ecs_task_definition_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = var.ecs_container_name
      image     = "${var.ecs_container_image}:${var.image_tag}"
      essential = true
      environment = [
        {
          name  = "APP_VERSION"
          value = var.image_tag
        }
      ]
      portMappings = [
        {
          containerPort = var.ecs_container_port
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.ecs_logs.name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

  depends_on = [aws_cloudwatch_log_group.ecs_logs]
}

resource "aws_ecs_service" "app" {
  name            = "hello-world-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = module.vpc.private_subnets
    security_groups = [aws_security_group.ecs_tasks.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.app.arn
    container_name   = "hello-world"
    container_port   = 8000
  }

  depends_on = [aws_lb_listener.front_end]
}