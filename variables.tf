variable "project_name" {
  description = "The Project name"
  type        = string
}

variable "vpc_id" {
  description = "The id of the vpc to put the service on"
  type        = string
}

variable "cron_expression" {
  description = "The cronjob expression format"
  type        = string
}

variable "aws_region" {
  description = "The AWS Default Region"
  type        = string
  default     = "eu-west-2"
}

variable "cpu_mb" {
  description = "The CPU in MegaBytes"
  type        = string
  default     = "256"
}

variable "memory_mb" {
  description = "The Memory in MegaBytes"
  type        = string
  default     = "512"
}

variable "public_ip" {
  description = "Should the service have a public ip"
  type        = bool
  default     = true
}

variable "task_count" {
  description = "The number of tasks to run"
  type        = number
  default     = 1
}

variable "log_retention_days" {
  description = "The number of days to keep the logs"
  type        = number
  default     = 30
}

variable "ecr_image_expire" {
  description = "The ECR images to keep"
  type        = number
  default     = 10
}