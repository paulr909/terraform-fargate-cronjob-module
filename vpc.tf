data "aws_subnet_ids" "vpc" {
  vpc_id = var.vpc_id
}