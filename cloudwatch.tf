# Create cloudwatch group
resource "aws_cloudwatch_log_group" "main" {
  name              = var.project_name
  retention_in_days = var.log_retention_days
  tags = {
    Name = var.project_name
  }
}