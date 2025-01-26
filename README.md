# CloudRide Exercise - ECS Application Deployment

This project demonstrates a complete AWS infrastructure deployment using Terraform, including a containerized "Hello World" application running on ECS with monitoring and CI/CD pipeline integration.

## Architecture Overview

The infrastructure consists of:
- VPC with 4 subnets (2 public, 2 private) across 2 AZs
- ECS Fargate cluster running a Hello World application
- Application Load Balancer for public access
- Auto-scaling configuration
- CloudWatch monitoring and alerting
- CI/CD pipeline using GitHub Actions

## Prerequisites

- AWS Account
- AWS CLI configured
- Terraform (v1.9.8+)
- Docker
- GitHub account
- S3 Bucket to store the terraform.tfstate file

## Infrastructure Components

### Networking (VPC)
- VPC CIDR: 10.0.0.0/16
- Public Subnets: 10.0.101.0/24, 10.0.102.0/24
- Private Subnets: 10.0.1.0/24, 10.0.2.0/24
- NAT Gateways for private subnet internet access
- Internet Gateway for public subnet access

### Container Infrastructure
- ECS Fargate cluster
- Service auto-scaling (min 2, max 4 tasks)
- CPU-based auto-scaling policy
- Application Load Balancer with HTTP listener
- ECR repository for container images

### Monitoring
- CloudWatch Log Groups for container logs
- Container error metric filter and alarm
- SNS topic for error notifications
- Email notifications for container errors

### Security
- Security groups for ALB and ECS tasks
- Private subnet placement for ECS tasks
- Public access only through ALB

## Application

A simple Flask application that:
- Responds with a "Hello World" message
- Includes health check endpoint
- Provides version information
- Implements error handling and logging

## CI/CD Pipeline

The GitHub Actions workflow (`cicd.yml`) automatically:
1. Builds the Docker image
2. Tags with Git commit SHA
3. Pushes to ECR
4. Deploy ECS service with new image

## Deployment Instructions

1. Configure AWS credentials:

```
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
export AWS_REGION="eu-central-1"
```

2. Initialize and apply Terraform:

```
cd infra
terraform init
terraform apply -var-file="envs/prod.tfvars"
```

3. Configure GitHub repository secrets:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION
- AWS_REGISTRY (ECR registry URL) 

## Testing the Alert System

The `example` folder contains scripts to test the monitoring system:

1. Clean up the alarm state:

```
./example/clean-cloudwatch-alarm-status.sh
```

2. Generate test errors:

```
./example/test-alert.sh
```

## Terraform Resources

Key Terraform configurations:
- `vpc.tf`: Network infrastructure
- `ecs.tf`: Container service configuration
- `asg.tf`: Auto-scaling settings
- `monitoring.tf`: CloudWatch configuration
- `alb.tf`: Load balancer setup
- `security.tf`: Security groups
- `iam.tf`: IAM roles and policies

## Notes

- The application runs on port 8000
- Auto-scaling triggers at 80% CPU utilization
- Container errors trigger alerts that send emails to the owner
- Infrastructure changes are tracked in S3 state bucket

## Clean Up

To destroy the infrastructure:

```
terraform destroy -var-file="envs/prod.tfvars"
```

## Contributing

Feel free to submit issues and enhancement requests.