variable "project_name" {
  description = "The Project name"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "The id of the vpc to put the service on"
}

variable "cron_expression" {
  type        = string
  description = "The cronjob expression format"
}

variable "aws_region" {
  type        = string
  description = "The AWS Default Region"
  default     = "eu-west-2"
}

variable "cpu_mb" {
  type        = string
  description = "The CPU in MegaBytes"
  default     = "256"
}

variable "memory_mb" {
  type        = string
  description = "The Memory in MegaBytes"
  default     = "512"
}

variable "public_ip" {
  type        = bool
  description = "Should the service have a public ip"
  default     = true
}

variable "task_count" {
  type        = number
  description = "The number of tasks to run"
  default     = 1
}

variable "log_retention_days" {
  type        = number
  description = "The number of days to keep the logs"
  default     = 30
}

variable "ecr_image_expire" {
  type        = number
  description = "The ECR images to keep"
  default     = 10
}