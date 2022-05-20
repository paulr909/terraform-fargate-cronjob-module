# Define the policies
data "aws_iam_policy_document" "cronjob" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "ecs-tasks.amazonaws.com",
        "events.amazonaws.com",
        "ecs.amazonaws.com"
      ]
    }
  }
}

# Create ECS Task role
resource "aws_iam_role" "cronjob" {
  name               = "${var.project_name}-cronjob-role"
  assume_role_policy = data.aws_iam_policy_document.cronjob.json
  tags = {
    Name = var.project_name
  }
}

# Attatch default ECS task role to the iam
resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.cronjob.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  role       = aws_iam_role.cronjob.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}