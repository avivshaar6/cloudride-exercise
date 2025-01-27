# AWS region
aws_region                                   = "eu-central-1"

# app variables
app_name                                     = "hello-world"

# VPC variables
vpc_name                                     = "aviv-main-vpc"
vpc_cidr_block                               = "10.0.0.0/16"
private_subnet_cidrs                         = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_cidrs                          = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_owner                                    = "aviv_s"

# ECS variables
ecs_container_image                          = "753392824297.dkr.ecr.eu-central-1.amazonaws.com/hello-world-app"
ecs_container_port                           = 8000

# ALB variables
load_balancer_type                         = "application"
alb_listener_front_end_port                = 8000
alb_listener_protocol                      = "HTTP"
alb_target_type                            = "ip"
