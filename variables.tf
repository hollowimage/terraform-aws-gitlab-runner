variable "aws_region" {
  description = "AWS region."
  type        = "string"
}

variable "environment" {
  description = "A name that identifies the environment, will used as prefix and for tagging."
  type        = "string"
}

variable "vpc_id" {
  description = "The VPC that is used for the instances."
  type        = "string"
}

variable "subnet_id_runners" {
  description = "Subnet used to hosts the docker-machine runners."
  type        = "string"
}

variable "subnet_id_gitlab_runner" {
  description = "Subnet used for hosting the gitlab-runner."
  type        = "string"
}

variable "instance_type" {
  description = "Instance type used for the gitlab-runner."
  type        = "string"
  default     = "t2.micro"
}

# list with amazon linux optimized images per region
# last updated on: 2017-11-19 https://aws.amazon.com/amazon-linux-ami/
variable "amazon_optimized_amis" {
  description = "AMI map per region-zone for the gitlab-runner instance AMI."
  type        = "map"

  default = {
    us-east-1      = "ami-97785bed" # N. Virginia
    us-east-2      = "ami-f63b1193" # Ohio
    us-west-1      = "ami-824c4ee2" # N. California
    us-west-2      = "ami-f2d3638a" # Oregon
    eu-west-1      = "ami-d834aba1" # Ireland
    eu-west-2      = "ami-403e2524" # London
    eu-central-1   = "ami-5652ce39" # Frankfurt
    ap-northeast-1 = "ami-ceafcba8" # Tokyo
    ap-northeast-2 = "ami-863090e8" # Seoel
    ap-southeast-1 = "ami-68097514" # Singapore
    ap-southeast-2 = "ami-942dd1f6" # Sydney
    ap-south-1     = "ami-531a4c3c" # Mumbai
    ca-central-1   = "ami-a954d1cd" # Canada
  }
}

variable "ssh_public_key" {
  description = "Public SSH key used for the gitlab-runner ec2 instance."
  type        = "string"
}

variable "docker_machine_instance_type" {
  description = "Instance type used for the instances hosting docker-machine."
  default     = "m4.large"
}

variable "docker_machine_spot_price_bid" {
  description = "Spot price bid."
  default     = "0.04"
}

variable "runners_name" {
  description = "Name of the runner, will be used in the runner config.toml"
  type        = "string"
}

variable "runners_gitlab_url" {
  description = "URL of the gitlab instance to connect to."
  type        = "string"
}

variable "runners_token" {
  description = "Token for the runner, will be used in the runner config.toml"
  type        = "string"
}

variable "runners_limit" {
  description = "Limit for the runners, will be used in the runner config.toml"
  default     = 0
}

variable "runners_concurrent" {
  description = "Concurrent value for the runners, will be used in the runner config.toml"
  default     = 10
}

variable "runners_idle_time" {
  description = "Idle time of the runners, will be used in the runner config.toml"
  default     = 600
}

variable "runners_idle_count" {
  description = "Idle count of the runners, will be used in the runner config.toml"
  default     = 0
}

variable "runners_privilled" {
  description = "Runners will run in privilled mode, will be used in the runner config.toml"
  type        = "string"
  default     = "true"
}

variable "docker_machine_user" {
  description = "User name for the user to create spot instances to host docker-machine."
  type        = "string"
  default     = "docker-machine"
}

variable "cache_user" {
  description = "User name of the user to create to write and read to the s3 cache."
  type        = "string"
  default     = "cache_user"
}

variable "cache_expiration_days" {
  description = "Number of days before cache objects expires."
  default     = 1
}

variable "gitlab_runner_version" {
  description = "Version for the gitlab runner."
  type        = "string"
  default     = "10.8.0"
}

variable "enable_cloudwatch_logging" {
  description = "Enable or disable the CloudWatch logging."
  default     = 1
}