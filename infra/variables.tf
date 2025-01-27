variable "aws_region" {
  type = string
}

variable "app_name" {
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

variable "ecs_container_image" {
  type = string
}

variable "ecs_container_port" {
  type = number
}

variable "image_tag" {
  type = string
}

variable "load_balancer_type" {
  type = string
}

variable "alb_listener_front_end_port" {
  type = number
}

variable "alb_listener_protocol" {
  type = string
}

variable "alb_target_type" {
  type = string
}