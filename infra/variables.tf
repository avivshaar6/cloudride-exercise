variable "aws_region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "vpc_owner" {
  type = string
}

variable "ecr_repository_name" {
  type = string
}

variable "image_tag_mutability" {
  type    = string
  default = "MUTABLE"
}

variable "ecs_cluster_name" {
  type    = string
  default = "hello-world-cluster"
}

variable "ecs_task_definition_name" {
  type    = string
  default = "hello-world-app"
}

variable "ecs_task_definition_family" {
  type    = string
  default = "hello-world-app"
}

variable "ecs_task_definition_network_mode" {
  type    = string
  default = "awsvpc"
}

variable "ecs_task_definition_requires_compatibilities" {
  type = list(string)
}

variable "ecs_task_definition_cpu" {
  type    = string
}

variable "ecs_task_definition_memory" {
  type    = string
}

variable "ecs_container_name" {
  type    = string
}

variable "ecs_container_image" {
  type = string
}

variable "ecs_container_port" {
  type = number
}

variable "image_tag" {
  type = string
}
