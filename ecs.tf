# Create the ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-cluster"
  tags = {
    Name = var.project_name
  }
}

# Create the actual cluster
resource "aws_ecs_service" "main" {
  name            = "${var.project_name}-cronjob"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = data.aws_subnet_ids.vpc.ids
    assign_public_ip = var.public_ip
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
  tags = {
    Name = var.project_name
  }
}

# Create task definition
resource "aws_ecs_task_definition" "main" {
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu_mb
  memory                   = var.memory_mb
  execution_role_arn       = aws_iam_role.cronjob.arn
  task_role_arn            = aws_iam_role.cronjob.arn
  family                   = "${var.project_name}-cronjob"
  container_definitions = jsonencode([
    {
      name      = "${var.project_name}-container"
      image     = aws_ecr_repository.main.repository_url
      essential = true
      logConfiguration : {
        logDriver : "awslogs",
        options : {
          "awslogs-group" : var.project_name
          "awslogs-region" : var.aws_region
          "awslogs-stream-prefix" : var.project_name
        }
      }
    }
  ])
  tags = {
    Name = var.project_name
  }
}
