resource "aws_ecr_repository" "hello-world-app" {
  name                 = var.ecr_repository_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = var.vpc_owner
  }
}
