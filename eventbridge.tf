# Create schedule rule
resource "aws_cloudwatch_event_rule" "main" {
  name        = "${var.project_name}-event-rule"
  description = "Cronjob rule for scheduling ${var.project_name}"
  schedule_expression = var.cron_expression
  tags = {
    Name = var.project_name
  }
}

# Define the target for the event rule
resource "aws_cloudwatch_event_target" "target" {
  target_id = "${var.project_name}-event-target"
  rule      = aws_cloudwatch_event_rule.main.name
  arn       = aws_ecs_cluster.main.arn
  role_arn  = aws_iam_role.cronjob.arn

  ecs_target {
    task_count          = var.task_count
    task_definition_arn = aws_ecs_task_definition.main.arn
  }
}