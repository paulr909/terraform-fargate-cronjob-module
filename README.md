# AWS Fargate cronjob Terraform module

Terraform module which creates all the basic cronjob resources on AWS Fargate.

## Usage
[AWS crontime format documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html)
```hcl
module "cronjob" {
  source = "git::https://github.com/profusionuk/terraform-fargate-cronjob-module.git"
  
  # This variable will be used for all resource naming
  # required
  project_name = "project-name"
  
  # This variable defines the crontime that the job runs at
  # required
  cron_expression = "cron(0 9 * * 2 *)"
  
  # This variable defines the list of network subnets to join
  # required
  network_subnets = [""]
  
  # This variable defines what region the resources are created in
  # not required
  # Default is "eu-west-2"
  aws_region = "eu-west-2"
  
  # This variable defines if the cronjob gets assigned a public ip
  # not required
  # Default value is true
  public_ip = true
  
  # This variable defines the amount of MB CPU the container gets
  # not required
  # Default value is 256
  cpu_mb = 256
  
  # This variable defines the amount of MB memory the container gets
  # not required
  # Default value is 512
  memory_mb = 512
  
  # This variable defines the amount of copies of tasks this job runs
  # not required
  # Default value is 1
  task_count = 1
  
  # This variable defines the amount of time the logs are kept for
  # not required
  # Default value is 30
  log_retention_days = 30
  
  # This variable defines the amount of container images to keep in the repo
  # not required
  # Default value is 10
  ecr_image_expire = 10
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |

## Providers

| Name                                              | Version |
|---------------------------------------------------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0  |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->