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
  type = string
  default = "MUTABLE"
}